# Create your views here.
from django.views.decorators.csrf import csrf_protect
from django.core.context_processors import csrf
from django.shortcuts import render_to_response
from django.shortcuts import render
from django.shortcuts import HttpResponse
from django.shortcuts import RequestContext
from code1.models import pro_player
from code1.models import pro_team
from code1.models import o_stats
from code1.models import p_stats
from code1.models import d_stats


def SearchProPlayer(request):
		
	#if request.POST == "POST":
	if request.method == 'GET' and 'pro-player-input' in request.GET:
	#if request.GET['pro-player-input']:
		#input = request.GET['pro-player-input']
		#if input == 'no':
		if request.GET['pro-player-input'] == 'no':
			message = 'enter a player...'
			context = {'message': message}
			return render_to_response('SearchProPlayer.html',context,context_instance=RequestContext(request))
			
		if request.GET['pro-player-input'] == 'yes':
			message = 'lets add a player...'
			context = {'addPlayer': message}
			return render_to_response('SearchProPlayer.html',context,context_instance=RequestContext(request))
		else:	
			input = request.GET['pro-player-input']
			dbPlayers = pro_player.objects.filter(pname=input) #remember this returns a query set
			if dbPlayers:
				# if len(dbPlayers) > 1:#if the query set only has 1 object in it
					# obj = dbPlayers[0]# turn that one object in the query set into an object
				obj = dbPlayers[0]
				o_stat = o_stats.objects.filter(playerID = obj.pID)
				if len(o_stat) >= 1: #--------must be >= -----
					o_stat = o_stat[0]
				if o_stats.objects.filter(playerID = obj.pID).count ==1:
					o_stat = o_stats.objects.get(playerID=obj.pID)#-----------	
						
				p_stat = p_stats.objects.filter(playerID = obj.pID)
				if len(p_stat) >= 1:
					p_stat = p_stat[0]
				if p_stats.objects.filter(playerID = obj.pID).count ==1:
					p_stat = p_stats.objects.get(playerID=obj.pID)#-----------
					
				d_stat = d_stats.objects.filter(playerID = obj.pID)
				if len(d_stat) >= 1:
					d_stat = d_stat[0]
				if d_stats.objects.filter(playerID = obj.pID).count ==1:
					d_stat = d_stats.objects.get(playerID=obj.pID)#-----------
					
					
				teams = pro_team.objects.filter(tname=obj.team)# now we can use the object to compare!
				message = 'found in database!'
				context = {'message': message,
						   'dbPlayers':dbPlayers,
						   'teams':teams,
						   'o_stats':o_stat,
						   'p_stat':p_stat,
						   'd_stat':d_stat}
				return render_to_response('SearchProPlayer.html',context,context_instance=RequestContext(request))
			
			elif input != "":
				message = 'Not found in database... would you like to add?'
				context = {'notFound': message}
				return render_to_response('SearchProPlayer.html',context,context_instance=RequestContext(request))
	
	message = 'enter a player...'
	context = {'message': message}
	return render_to_response('SearchProPlayer.html', context, context_instance=RequestContext(request))
	
def AddProPlayer(request):
	
	if request.method == 'POST':
		#checks if the name is already in the db
		name = request.POST['player-name']
		dbName= pro_player.objects.filter(pname=name)
		if dbName:
			message ="player ''" + name + "'' already in database"
			context ={'addPlayer':message}
			return render_to_response('SearchProPlayer.html', context,context_instance=RequestContext(request))
		#checks if the birthday is valid
		birthday = request.POST['birthday']
		if birthday == "":
			error ="please enter in a date"
			return render_to_response('SearchProPlayer.html', {"addPlayer":error}, context_instance=RequestContext(request))
		#checks if the player id is a number
		player_id = request.POST['id']
		if not player_id.isnumeric():
			message= "player id must be a number"
			context= {'addPlayer': message}
			return render_to_response('SearchProPlayer.html', context,context_instance=RequestContext(request))
		#checks if the player id is already used
		db_id = pro_player.objects.filter(pID = player_id)
		if db_id:
			message= "player id ''" + player_id + "'' already in database"
			context= {'addPlayer': message}
			return render_to_response('SearchProPlayer.html', context,context_instance=RequestContext(request))
		#gets the other data from the form
		height = request.POST['height']
		weight = request.POST['weight']
		position = request.POST['position']
		playerTeam = request.POST['team']#get the team name from the form
		pTeam = pro_team.objects.get(tname=playerTeam)#find an instance from pro_team that has the same team name
		makePlayer = pro_player(pname=name,height=height,weight=weight,birthDay=birthday,pposition=position,team=pTeam,pID=player_id)
		makePlayer.save()
		# makeOstats = o_stats(average=0.00,slg=0.00,obs=0.00,hits=0,twoB=0,threeB=0,HR=0,RBI=0,SB=0,BB=0,K=0,playerID=makePlayer.pID)
		# makeOstats.save()
	message = "player added succesfully"
	context ={'message':message}
	
	return render_to_response('SearchProPlayer.html', context,context_instance=RequestContext(request))
	
def UpdatePlayer(request):

	if request.method == 'POST' and 'update-input' in request.POST: 
		input = request.POST['update-input']
		if pro_player.objects.filter(pname__icontains=input):
			name = pro_player.objects.filter(pname__icontains=input)
			name = name[0]
		if pro_player.objects.filter(pname__contains=input).count == 1:
			name = pro_player.objects.get(pname__icontains=input)
		# else:
			# name = pro_player.objects.filter(pname__contains=input)
			# name = name[0]
			
		o_stat = o_stats.objects.filter(playerID = name.pID)
		if len(o_stat) >= 1: #this has to be >= or all hell breaks loose
			o_stat = o_stat[0]
		if o_stats.objects.filter(playerID = name.pID).count == 1:
			o_stat = o_stats.objects.get(playerID = name.pID)
		
		p_stat = p_stats.objects.filter(playerID = name.pID)
		if len(p_stat) >= 1:
			p_stat = p_stat[0]
		if p_stats.objects.filter(playerID = name.pID).count == 1:
			p_stat = p_stats.objects.get(playerID = name.pID)
		
		d_stat = d_stats.objects.filter(playerID = name.pID)
		if len(d_stat) >= 1:
			d_stat = d_stat[0]
		if d_stats.objects.filter(playerID = name.pID).count == 1:
			d_stat = d_stats.objects.get(playerID = name.pID)
		
		context ={'player':name,
				  'o_stats':o_stat,
				  'p_stats':p_stat,
				  'd_stats':d_stat}
		return render_to_response('UpdatePlayer.html', context,context_instance=RequestContext(request))
	
	if request.method == 'POST': 
		
		#personal info
		name = request.POST['name']
		height = request.POST['height']
		weight = request.POST['weight']
		birthday = request.POST['birthday']
		position = request.POST['position']
		team = request.POST['team']
		id = request.POST['id']
		player = pro_player.objects.get(pID = id)
		team = pro_team.objects.get(tname=team)
		player.pname = name
		player.height = height
		player.weight = weight
		player.pposition = position
		player.team = team
		player.save()
		
		#ostats
		average = request.POST['average']
		slg = request.POST['slg']
		obs = request.POST['obs']
		ops = request.POST['ops']
		hits = request.POST['hits']
		twoB = request.POST['twoB']
		threeB = request.POST['threeB']
		HR = request.POST['HR']
		RBI = request.POST['RBI']
		SB = request.POST['SB']
		BB = request.POST['BB']
		K = request.POST['K']
		if o_stats.objects.filter(playerID = id):#if o_stat is a queryset take the first one
			o_stats.objects.filter(playerID=id).update(average=average)
			o_stats.objects.filter(playerID=id).update(slg=slg)
			o_stats.objects.filter(playerID=id).update(obs=obs)
			o_stats.objects.filter(playerID=id).update(ops=ops)
			o_stats.objects.filter(playerID=id).update(hits=hits)
			o_stats.objects.filter(playerID=id).update(twoB=twoB)
			o_stats.objects.filter(playerID=id).update(threeB=threeB)
			o_stats.objects.filter(playerID=id).update(HR=HR)
			o_stats.objects.filter(playerID=id).update(RBI=RBI)
			o_stats.objects.filter(playerID=id).update(SB=SB)
			
		else: # if it isnt a queryset then it doesnt exist and we need to make a instance of o_stats for the player
			player_instance = pro_player.objects.get(pID=id)
			o_stat = o_stats(average=0.00,slg=0.00,obs=0.00,hits=0,twoB=0,threeB=0,HR=0,RBI=0,SB=0,BB=0,K=0,playerID=player_instance)
			o_stat.average = average
			o_stat.slg = slg
			o_stat.obs = obs
			o_stat.ops = ops
			o_stat.hits = hits
			o_stat.twoB = twoB
			o_stat.threeB = threeB
			o_stat.HR = HR
			o_stat.RBI = RBI
			o_stat.SB = SB
			
			o_stat.save()
			
			
			#p_stats
		W = request.POST['W']
		L = request.POST['L']
		ERA = request.POST['ERA']
		WHIP = request.POST['WHIP']
		K = request.POST['K']
		BB = request.POST['BB']
		SV = request.POST['SV']
		if p_stats.objects.filter(playerID = id):#if o_stat is a queryset take the first one
			p_stats.objects.filter(playerID=id).update(W=W)
			p_stats.objects.filter(playerID=id).update(L=L)
			p_stats.objects.filter(playerID=id).update(ERA=ERA)
			p_stats.objects.filter(playerID=id).update(WHIP=WHIP)
			p_stats.objects.filter(playerID=id).update(K=K)
			p_stats.objects.filter(playerID=id).update(BB=BB)
			p_stats.objects.filter(playerID=id).update(SV=SV)
		else: # if it isnt a queryset then it doesnt exist and we need to make a instance of o_stats for the player
			player_instance = pro_player.objects.get(pID=id)
			p_stat = p_stats(W=0,L=0,ERA=0.00,WHIP=0.00,K=0,BB=0,SV=0,playerID=player_instance)
			p_stat.W = W
			p_stat.L = L
			p_stat.ERA = ERA
			p_stat.WHIP = WHIP
			p_stat.K = K
			p_stat.BB = BB
			p_stat.SV = SV
			p_stat.save()
		
		fld_pct = request.POST['fld_pct']
		errors = request.POST['errors']
		# if int(fld_pct):
			# message ="update FAILED, make sure each box has the correct type!"
			# context ={'message':message}
			# return render_to_response('SearchProPlayer.html', context,context_instance=RequestContext(request))
		
		if d_stats.objects.filter(playerID = id):
			d_stats.objects.filter(playerID=id).update(fld_pct=fld_pct)
			d_stats.objects.filter(playerID=id).update(errors=errors)
		else:
			player_instance = pro_player.objects.get(pID=id)
			d_stat = d_stats(fld_pct=0.00, errors=0, playerID=player_instance)
			d_stat.fld_pct = fld_pct
			d_stat.errors = errors
			d_stat.save()
		
	
	message ="Your update was a Success!"
	context ={'message':message}
	return render_to_response('SearchProPlayer.html', context,context_instance=RequestContext(request))
	
	
	
	
	
	
	