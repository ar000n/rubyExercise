class Mobile
  @phones = ['samsung', 'LG', 'lenovo']
  @models = {'LG'=> ['L1', 'G2', 'GO'],'samsung'=>['Duos','S6','S4'],'lenovo'=>['A516','K3','champ']}
  @stock = {'L1'=> 4, 'G2'=> 6, 'GO'=> 45,'Duos'=> 23,'S6'=> 8,'S4'=> 12,'A516'=> 17,'K3'=> 24,'champ'=> 27}
  puts @phones
  @phone = gets
  puts @models[@phone.strip()]
  @model = gets

  puts @stock[@model.strip()]

end
sam = Mobile.new
