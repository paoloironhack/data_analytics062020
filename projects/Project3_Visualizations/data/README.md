## George Michael vs Wham! Dataset

You can find a copy of the dataset that I used here:

https://drive.google.com/file/d/1raojujIBUYEnVVZWmkcdXJ879N23vLch/view?usp=sharing


This data was pulled from the Spotify API:
https://api.spotify.com/v1

I then used the Spotipy library to pull the data points that I needed. 
https://spotipy.readthedocs.io/en/2.16.0/


The specific track and album attributes are calculated by Spotify's own algorithms, so for composite ratings such as 'popularity', 'danceability' etc, these are made up a handful of factors which are not always accessible to the user. 

However, these are all listed in the Spotify API documentation, and I have included here the specific ones that I have ued in my notebook:

### Acousticness: 
'A confidence measure from 0.0 to 1.0 of whether the track is acoustic. 1.0 represents high confidence the track is acoustic. '

### Tempo: 
'The overall estimated tempo of a track in beats per minute (BPM). In musical terminology, tempo is the speed or pace of a given piece and derives directly from the average beat duration. '

### Danceability: 
'Danceability describes how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity. A value of 0.0 is least danceable and 1.0 is most danceable.'

### Energy: 
'Energy is a measure from 0.0 to 1.0 and represents a perceptual measure of intensity and activity. Typically, energetic tracks feel fast, loud, and noisy. For example, death metal has high energy, while a Bach prelude scores low on the scale. Perceptual features contributing to this attribute include dynamic range, perceived loudness, timbre, onset rate, and general entropy. '

### Popularity:
'The popularity of a track is a value between 0 and 100, with 100 being the most popular. The popularity is calculated by algorithm and is based, in the most part, on the total number of plays the track has had and how recent those plays are.
Generally speaking, songs that are being played a lot now will have a higher popularity than songs that were played a lot in the past. Duplicate tracks (e.g. the same track from a single and an album) are rated independently. Artist and album popularity is derived mathematically from track popularity. Note that the popularity value may lag actual popularity by a few days: the value is not updated in real time.'
