function testString(a){
	if (a == "bye" && !hist.include("hi")) {
    return "on commence par bonjour en général !"
	} else if (a.substr(0,12) == "je m'appelle" && a.length > 13 && !hist.include?("presenter")) {
    return "enchantée, "+a.substr(13,a.length) +" ! je m'appelle Greta.";
    hist.push("presenter");
  }  else if (a == "bonjour" && !hist.include?("hi")) {
    return "bonjour. Merci de venir me parler !";
    hist.push("hi")
  }  else if (a == "au revoir" && !hist.include?("bye")) {
    return "au revoir. Merci de votre sollicitation !";
    hist.push("bye");
  } else {
    return "ecrivez 'bonjour', 'au revoir', ou 'je m'appelle ...'";
  }
}