/*
 * Calculates the hashtags that are commonly used with the hashtag #coronavirus
 */

SELECT '#' || f.tag AS tag, COUNT(*) as count 
FROM (
    SELECT DISTINCT 
        data->>'id' AS id_tweets,
        jsonb_array_elements(
            COALESCE(data->'entities'->'hashtags','[]') || 
            COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]')
        ) ->>'text'::TEXT AS tag
        FROM tweets_jsonb WHERE (data -> 'entities'->'hashtags') @> '[{"text":"coronavirus"}]' OR (data -> 'extended_tweet'->'entities'->'hashtags') @> '[{"text":"coronavirus"}]'
    ) f    
GROUP BY tag
ORDER BY count DESC, tag 
LIMIT 1000;
