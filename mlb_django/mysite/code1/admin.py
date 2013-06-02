from code1.models import pro_player, pro_team, o_stats, p_stats, d_stats
from django.contrib import admin

class pro_player_admin(admin.ModelAdmin):
	list_display=['pname','height','weight','birthDay','debuteDate','pposition','team','pID']
	
admin.site.register(pro_player, pro_player_admin)
	
class pro_team_admin(admin.ModelAdmin):
	list_display=['tname','city','record','sAddress']

admin.site.register(pro_team, pro_team_admin)

class o_stats_admin(admin.ModelAdmin):
	list_display=['playerID','average','slg','obs','ops','hits','twoB','threeB','HR','RBI','SB','BB','K']

admin.site.register(o_stats, o_stats_admin)

class p_stats_admin(admin.ModelAdmin):
	list_display=['playerID','W','L','ERA','WHIP','K','BB','SV']
	
admin.site.register(p_stats, p_stats_admin)

class d_stats_admin(admin.ModelAdmin):
	list_display=['playerID','fld_pct','errors']
	
admin.site.register(d_stats, d_stats_admin)