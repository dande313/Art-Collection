art_list = {
    "Wanderer above the Sea of Fog" => {
      :artist => "Kunsthalle Hamburg",
      :year => 1819,
      :medium => "Oil on Canvas",
      :description => "In the foreground, a young man stands upon a rocky precipice with his back to the viewer. He is wrapped in a dark green overcoat, and grips a walking stick in his right hand. His air caught in a wind, the wanderer gazes out on a landscape covered in a thick sea of fog. In the middle ground, several other ridges, perhaps not unlike the ones the wanderer himself stands upon, jut out from the mass. Through the wreaths of fog, forests of trees can be perceived atop these escarpments. In the far distance, faded mountains rise in the left, gently leveling off into lowland plains in the east. Beyond here, the pervading fog stretches out indefinitely, eventually commingling with the horizon and becoming indistinguishable from the cloud-filled sky.",
      :user_id => 1
    },
    "The Persistence of Memory" => {
      :artist => "Salvador Dali",
      :year => 1931,
      :medium => "Oil on Canvas",
      :description => "The well-known surrealist piece introduced the image of the soft melting pocket watch. It epitomizes Dalí's theory of 'softness' and 'hardness', which was central to his thinking at the time. As Dawn Adès wrote,'The soft watches are an unconscious symbol of the relativity of space and time, a Surrealist meditation on the collapse of our notions of a fixed cosmic order'.This interpretation suggests that Dalí was incorporating an understanding of the world introduced by Albert Einstein's theory of special relativity. Asked by Ilya Prigogine whether this was in fact the case, Dalí replied that the soft watches were not inspired by the theory of relativity, but by the surrealist perception of a Camembert melting in the sun.",
      :user_id => 1
    },
    "Earth Between the Rings of Saturn" => {
      :artist => "The Cassini spacecraft (NASA)",
      :year => 2017,
      :medium => "Photograph",
      :description => "The spacecraft captured the view on April 12, 2017, at 10:41 p.m. PDT (1:41 a.m. EDT on April 13). Cassini was 870 million miles (1.4 billion kilometers) away from Earth when the image was taken. Although far too small to be visible in the image, the part of Earth facing Cassini at the time was the southern Atlantic Ocean. Earth's moon is also visible nearby in a cropped, zoomed-in version of the image.",
      :user_id => 1
    },
    "V-J Day in Times Square" => {
      :artist => "Alfred Eisenstaedt",
      :year => 1945,
      :medium => "Photograph",
      :description => "Portrays a U.S. Navy sailor grabbing and kissing a stranger—a woman in a white dress—on Victory over Japan Day ('V-J Day') in New York City's Times Square on August 14, 1945. The photograph was published a week later in Life magazine, among many photographs of celebrations around the United States that were presented in a twelve-page section titled 'Victory Celebrations'.",
      :user_id => 1
    },
    "Varvakeion Athena" => {
      :artist => "Phidias",
      :year => 200,
      :medium => "Marble Sculpture",
      :description => "Athena is dressed in a peplos belted with a zone in the form of two snakes; over this she wears the aegis, decorated with snakes and with the gorgoneion in the center. She wears an Attic helmet with the cheek guards upturned; it has three crests, the center sporting a sphinx and those on the sides a pegasus. Her left hand rests on the rim of a shield which also bears the gorgoneion; the shield rests against the oikouros ophis (sacred snake) identified with Erichthonios, the city's legendary founder. The outstretched right hand is supported by a column and holds a winged figure of Nike, the head of which is missing. This smaller image is likewise garbed in a peplos and is turned somewhat towards the main figure. The whole assemblage rests on a rectangular base.",
      :user_id => 1
    },
    "The Monument of an Anonymous Passerby" => {
      :artist => "Jerzy Kalina",
      :year => 1977,
      :medium => "Bronze Sculpture",
      :description => "The installation consists of 14 figures. The main character is a woman, and the other figures are her family, half of whom fall to the ground in front of her, and the other half of whom are climbing up behind her. These are statues of ordinary people going about their daily business. But something isn’t right. On one corner the people are sinking into the pavement, and across the street, another group is rising out of the sidewalk. This art can be enjoyed at face value, but to truly appreciate the artist’s poignant message, it takes a glimpse at Poland’s recent turbulent history.",
      :user_id => 2
    },

    

  }

art_list.each do |title, art_hash|
  work = Work.new
  work.title = title
  art_hash.each do |attribute, value|
      work[attribute] = value
  end
  work.save
end