# encoding: utf-8
# Autogenerated by the db:seed:dump task
# Do not hesitate to tweak this to your needs


Tag.create([
               {:name => "education", :image => nil, :created_at => "2013-09-10 11:22:23", :updated_at => "2013-09-10 11:22:23", :disabled => false, :active_count => 0},
               {:name => "sport", :image => nil, :created_at => "2013-09-10 11:24:06", :updated_at => "2013-09-10 11:24:06", :disabled => false, :active_count => 0},
               {:name => "travel", :image => nil, :created_at => "2013-09-10 11:25:45", :updated_at => "2013-09-10 11:25:45", :disabled => false, :active_count => 0}
           ], :without_protection => true)


#100000.times do
#  News.create([
#                  { :title => "Украина не откажется от евроинтеграции ради более тесного сотрудничества с Таможенным союзом", :short_info => "КИЕВ, 10 сентября. /ИТАР-ТАСС/. Украина не планирует отказываться от европейской интеграции ради более тесного сотрудничества с Таможенным союзом Белоруссии, Казахстана и России. Это подчеркнул вице-премьер Украины Александр Вилкул в опубликованном сегодня интервью польскому изданию Gazeta Wyborcza.", :disabled => false, :content => "\"Стратегической целью, на которую ничто не повлияет, является подписание Соглашения об ассоциации в Вильнюсе. Этого хочет большинство украинцев, есть консенсус всех политических сил, поддержка президента страны Виктора Януковича\", - отметил Вилкул.\r\nПо его словам, украинский парламент уже принял ряд необходимых для подписания этого документа законов. \"Остальные законы парламент успеет принять до саммита \"Восточного партнерства\" в ноябре\", - добавил вице-премьер.", :image => "1378812564-95fec2b8e63c02f20f1c2c7261b66e1b.JPEG", :user_id => 1, :lt => 49.23433409935593, :lg => 28.453019195556635, :tag_1 => "sport", :tag_2 => "travel", :tag_3 => "none", :created_at => "2013-09-10 11:29:24", :updated_at => "2013-09-10 11:30:19", :valid_to => nil },
#              ], :without_protection => true )
#end


User.create([
                {:first => "andrew", :last => "nazymko", :e_mail => "some@e.mail", :password => "2105", :login => "core_admin", :role => "core_admin"},
                {:first => "super", :last => "user", :e_mail => "some@e.mail", :password => "2105", :login => "admin", :role => "admin"},
                {:first => "Jo", :last => "Kamton", :e_mail => "dieg0@gmail.com", :password => "2105", :login => "diego", :role => "subscriber"}
            ], :without_protection => true)


Category.create([
                    {:name => 'Кино', :disabled => 0},
                    {:name => 'Театр', :disabled => 0},
                    {:name => 'Клуб', :disabled => 0},
                    {:name => 'Спорт', :disabled => 0},
                    {:name => 'Акция', :disabled => 0},
                    {:name => 'Концерты', :disabled => 0},
                    {:name => 'Выставкы', :disabled => 0},
                    {:name => 'Другое', :disabled => 0},
                ])