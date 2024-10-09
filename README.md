# Netflix Analysis Project

## Overview

This project presents a thorough analysis of Netflix's Movies and TV Shows dataset using SQL.
The primary goal is to extract meaningful insights and address various business questions related to the content on Netflix. The analysis explores multiple aspects of Netflix's content, including type distribution, ratings, release years, and more, providing actionable insights into content strategy.

![new-movies-and-shows-coming-on-netflix-heres-the-list](https://github.com/user-attachments/assets/5f770b8e-42e9-4b51-8332-133c09b29e66)


## Objectives

- **Content Type Distribution**: Analyse the distribution of content types (Movies vs. TV shows).
- **Common Ratings**: Identify the most frequent ratings assigned to movies and TV shows.
- **Release Year Analysis**: List and analyse content based on release years, countries, and durations.
- **Content Categorization**: Explore and categorize content based on specific criteria and keywords.

Snippet SCHEMA(For more check the uploaded Netflix.sql)
-- 17.  Oldest movies on Netflix
'''sql
SELECT title, type,release_year
FROM NETFLIX
GROUP BY show_id
ORDER BY release_year ASC
'''
Objective: Identify the oldest movies on Netflix by sorting content by release year to understand the historical range of available content.
--There are movies / TV Shows on the platform which were released way back in 1920s.


## Findings and Conclusions

- Content Distribution: The dataset contains a wide variety of movies and TV shows, showcasing diverse ratings and genres.
- Common Ratings: Insights into the most common ratings reveal the target audience for the content.
- Geographical Insights: The analysis highlights the top countries and the average number of content releases, particularly emphasizing India's significant contributions.
- Content Categorization: Classifying content based on specific keywords enhances understanding of the nature and themes present in Netflix's offerings.

This analysis offers a comprehensive view of Netflix's content and can help in shaping content strategy and decision-making processes.


This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or are interested in collaboration, please feel free to reach out!
