class AddWords < ActiveRecord::Migration[6.0]
  def up

    # first create another model to associate tweets and words.
    # and then add words to word table and add the association of that word to tweet
    # dont forget to stem and lemma the words either

    tweets = Tweet.all.to_a
    tweets.each do |tweet| 
      words = tweet.content.split(' ')

    end
  end
  
  def down
    Word.destroy_all
  end
end
