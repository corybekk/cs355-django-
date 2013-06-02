from django.db import models
# Create your models here.

class pro_player( models.Model ):
    class Meta:
        db_table = 'pro_player'
        
    pID = models.CharField(max_length=10,primary_key=True)
    pname = models.CharField(max_length=20)
    height = models.CharField(max_length=20)
    weight = models.CharField(max_length=10)
    birthDay = models.DateTimeField('birth date')
    debuteDate = models.DateTimeField('debut date')
    pposition = models.CharField(max_length=10)
    team = models.ForeignKey('pro_team',db_column='team')

    def __unicode__(self):
        return unicode(self.pname)
	
	def team(self):
		return unicode(self.team)
        
class pro_team ( models.Model ):
    class Meta:
        db_table = 'pro_team'
        
    tname = models.CharField(max_length=20, primary_key=True)
    league = models.CharField(max_length=2)
    city = models.CharField(max_length=20)
    record = models.CharField(max_length=10)
    sAddress = models.CharField(max_length=50)
        
    def __unicode__(self):
        return self.tname

class o_stats ( models.Model ):
    class Meta:
        db_table = 'o_stats'
	
    average = models.DecimalField(max_digits = 3, decimal_places=3, default = 0.00)
    slg = models.DecimalField(max_digits = 3, decimal_places =3, default = 0.00)
    obs = models.DecimalField(max_digits = 3, decimal_places =3, default = 0.00)
    ops = models.DecimalField(max_digits = 3, decimal_places =3, default = 0.00)
    hits = models.IntegerField(primary_key = True, default = 0)
    twoB = models.IntegerField(db_column ='2B', default = 0)
    threeB = models.IntegerField(db_column='3B', default = 0)
    HR = models.IntegerField( default = 0)
    RBI = models.IntegerField(default = 0)
    SB = models.IntegerField(default = 0)
    BB = models.IntegerField(default = 0)
    K = models.IntegerField(default = 0)
    playerID = models.ForeignKey('pro_player',db_column='playerID')
	
    def __unicode__(self):
        return unicode(self.playerID)
  
class p_stats( models.Model ):
    class Meta:
        db_table = 'p_stats'

    W = models.IntegerField()
    L = models.IntegerField()
    ERA = models.DecimalField(max_digits = 3, decimal_places = 2)
    WHIP = models.DecimalField(max_digits = 3, decimal_places = 2)
    K = models.IntegerField()
    BB = models.IntegerField()
    SV = models.IntegerField(primary_key = True)
    playerID = models.ForeignKey('pro_player', db_column='playerID')    

    def __unicode__(self):
         return unicode(self.playerID)
		 
class d_stats( models.Model ):    
    class Meta:
        db_table = 'd_stats'

    fld_pct = models.DecimalField(max_digits = 3, decimal_places = 3)
    errors = models.IntegerField(primary_key = True)
    playerID = models.ForeignKey('pro_player',db_column='playerID')

    def __unicode__(self):
         return self.playerID
