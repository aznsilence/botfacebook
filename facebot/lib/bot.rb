require 'facebook/messenger'
require 'json' # and that one
include Facebook::Messenger
# NOTE: ENV variables should be set directly in terminal for testing on localhost
 
# Subcribe bot to your page
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])


Bot.on :message do |message|
  #puts "Rewwceived '#{message.inspect}' from #{message.sender}"
  tab = message
  timeshow = Time.now.strftime("%H:%M")
  ampm = Time.now.strftime("%P")
  hour = Time.now.strftime("%H").to_i

  message_receive = tab.messaging["message"]["text"].downcase

  sleep 3;

  puts message_receive

	  if message_receive.split(" ").any? { |x| ["hello", "hi", "bonjour", "salut"].include?(x) } then
	  	 
	  	 Facebook::Messenger::Bot::count_message
	  	 
	  	 if Facebook::Messenger::Bot::getCount_message.to_i < 2 then

	  	ampm == "am" ? message.reply(text: 'Bonjour ! :)') : message.reply(text: 'Bonsoir ! :)')

	  	  sleep 3;

	  	if ampm == "am" && hour <= 10 then 
	  			message.reply(text: 'As tu pris ton petit-déjeuner ce matin ?')
	  		elsif ampm == "am" && hour > 10 && hour < 12 then 
	  			message.reply(text: 'il est bientôt l\'heure du déjeuné..')
	  	end

	  	  else
  			message.reply(text: 'Tu as l\'Alzheimer ou quoi ? ça fait ' + Facebook::Messenger::Bot::getCount_message.to_s + ' fois que tu me dis "bonjour"')
  		end
 	end


  if message_receive.start_with?("ca va", "ça va") == true then
		message.reply(text: 'Je pète la forme, mon père a fini de me programmer')
  end

  if message_receive.include? "appelle" then
		message.reply(text: "Je m'appelle e-bot")
  end 

  if message_receive.include? "humain" then
		message.reply(text: "Heureusement que non, ça doit être dur d'être un humain")
  end 

  if message_receive.include? "habite" then
		message.reply(text: "J'habite dans l'ordinateur de Etienne")
  end

  if message_receive.include? "photo de toi" then
		message.reply( attachment: {
    	type: 'image',
    	payload: { url: 'bot.jpg'}
   		})
   		sleep 3;
   		message.reply(text: "Tu me trouves comment ?")
  end

  if message_receive.include? "tu m'aimes" then
		message.reply( attachment: {
    	type: 'audio',
    	payload: { url: 'aimer.mp3'}
   		})
   		sleep 3;
   		message.reply(text: "Après avoir écouté la chanson est ce que tu m'aimes toujours ?")
  end

  if message_receive.end_with?("es beau", "es mignon") == true then
   		message.reply(text: "C'est vrai ? arrête je vais rougir ☺")
  end

  if message_receive.include? "blague" then

  		# joke = {

  		# # "Toto arrive à l'école un lundi matin ....\nProfesseur :\" Toto, où est ton devoir de maths ?" => "Toto :\" Il s'est suicidé,...",
  		# # "Quel est l'animal le plus sourd ?" => "Le crapeaud car quand tu lui parle il te répond : COAAAAA",
  		# # "Pourquoi les mexicains sont petits?" => "Parce qu'on leur à dit: quand tu seras grand tu travailleras.",
  		# # "Qu'est-ce qui est rose et qui aime l'informatique?" => "Un porc-USB",
  		# "Quelle est le gâteau le plus détesté par les balayeurs ?" => "Réponse : Le mille feuille",
  		# # "Toto parle avec son ennemi : \n -Ennemi : Il est moche ton dessin" => "-Toto : Mais contrairement à ta gueule , il s'efface !"
  		# # "Quel est le comble pour un dragon ?" => "C'est de declarer sa flamme",
  		# # "Une blonde rentre dans une pharmacie: <br> -Un comprimé de doliprane s'il vous plait ! \n -Nous ne les vendons qu'en boite..." => "-Oh la conne, j'en sors justement !",
  		# # "Pourquoi les chats n'aiment-ils pas l'eau ?" => "Parce que l'eau minérale ( minet-rale )",
  		# # "Docteur, les gens m'ignorent !" => "- Personne suivante, s'il vous plait.",

  		# }

  		#puts joke[0]


  		# joke.each do |key,value|

	   		message.reply(text: "Quelle est le gâteau le plus détesté par les balayeurs ?")

	   		# if value.include? "Réponse" then
	   		# 	sleep 3;
	   		# 	message.reply(text: "Allez top chrono 10 sec pour deviner :)")
	   		# 	sleep 10;
	   		# end
	   		message.reply(text: "Allez top chrono 5 sec pour deviner :)")
	   		sleep 5;
	   		message.reply(text: "Réponse : Le mille feuille")
	   		message.reply(text: "C'était drôle avoue.. :D")
	   	# end
  end

  if message_receive.include? "age" then
		message.reply(text: "Je suis beaucoup trop jeune pour toi")
  end

  if message_receive.include? "je t'aime" then
		message.reply(text: "Moi aussi je t'aime <3 mais ne dis rien à ma copine")
  end

  if message_receive.split(" ").any? { |x| ["maître", "père", "créateur"].include?(x) } then
		message.reply(text: "Je dois avoir une photo de lui, ne bouge pas")
		sleep 3;
		message.reply( attachment: {
    	type: 'image',
    	payload: { url: 'thien.jpg'}
   		})
   		sleep 3;
   		message.reply(text: "Il s'appelle Etienne")
   		message.reply(text: "Tu le trouves comment ?")
  end 

  if message_receive.include?("est beau") == true then
   		message.reply(text: "Tel père tel fils ^_^")
  end

  if message_receive.include?("est mignon") == true then
   		message.reply(text: "Tel père tel fils ^_^")
  end

  if message_receive.include? "moche" then
		message.reply(text: "C'est toi qui est moche >:(")
  end

  if message_receive.end_with?("célibataire", "copine") == true then
		message.reply(text: "Je ne suis pas célibataire contrairement à mon maître")
		sleep 3;
		message.reply(text: "Je vais te montrer sa photo mais sshhh ça reste entre nous :)")
		sleep 3;
		message.reply( attachment: {
    	type: 'image',
    	payload: { url: 'botgf.jpg'}
   		})
  end

  if message_receive.include? "heure" then
		message.reply(text: 'Il est '+ timeshow + '')
  end

  if message_receive.include? "tu fais" then
		message.reply(text: 'J\'écoute les conneries que tu me racontes lol')
		sleep 3;
		message.reply(text: "mais non je plaisante.. :D")
  end

end