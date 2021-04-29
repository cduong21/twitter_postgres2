CREATE INDEX tweetsjsonb_idx_tags ON tweets_jsonb USING gin((data->'entities'->'hashtags'));
CREATE INDEX tweetsjsonb_idx_tags2 ON tweets_jsonb USING gin((data -> 'extended_tweet'->'entities'->'hashtags'));
CREATE INDEX tweetsjsonb_idx_gin ON tweets_jsonb USING gin(to_tsvector('english',COALESCE(data->'extended_tweet'->>'full_text', data->>'text'))) WHERE (data->>'lang'='en');
