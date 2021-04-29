-- for 1,2
CREATE index tweetstags_idx_tagid on tweet_tags(tag, id_tweets);
CREATE index tweetstags_idx_idtag on tweet_tags(id_tweets, tag);
-- for 3 
CREATE index tweets_idx_lang on tweets(id_tweets, lang);
-- for 4 and 5 
create index tweets_idx_gin on tweets USING gin(to_tsvector('english', text)) WHERE lang='en';

