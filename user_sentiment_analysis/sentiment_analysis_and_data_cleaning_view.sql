SELECT
   TRIM(REPLACE(REPLACE(LOWER(p1.ml_generate_text_llm_result), '.', ''), ' ', '')) AS sentiment
   , REGEXP_REPLACE(
      REGEXP_REPLACE(
         REGEXP_REPLACE(
            p1.social_media_source
            , r'Google(\+|\sReviews|\sLocal|\sMy\sBusiness|\sreviews|\sMaps)?'
            , 'Google')
         , 'YELP'
         , 'Yelp'),
      r'SocialMedia1?'
      , 'Social Media') AS social_media_source
   , p1.review_text
   , p1.customer_id
   , p1.location_id
   , p1.review_datetime
   , p2.ml_generate_text_llm_result AS review_text_keywords
FROM
   `**********` p1
   INNER JOIN `**********` p2 ON
      p1.customer_id = p2.customer_id
      AND p1.location_id = p2.location_id