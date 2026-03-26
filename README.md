# README
This is a schedule viewer for work orders assigned to different technicians within a single day. It’s designed as a grid similar to Google Calendar, with additional details displayed inside each work order block.

### DEPENDENCIES and PREREQS

### SETUP
1. Clone the repo to your local directory using git clone https://github.com/aarushi-v-singh/TerrierRails.git
2. Enter the directory using cd TerrierRails
3. Install all dependencies listed in Gemfile using bundle install
4. Set up SQLite DB with model tables using rails db:prepare
5. Populate DB using rails db:importCSVs
6. Start running the server and view the website using rails server

### APPROACH
Ruby on Rails follows an MVC pattern, so I approached the project by building out each component step by step. I relied mostly on the official Rails guides and GeeksforGeeks to get comfortable with setup, structure, and common patterns.

For the model layer, I created a CSV directory inside the db folder to store the provided CSV data. Then I defined models corresponding to each CSV entity and wrote a rake task to load the data into a SQLite database (one I'm most familiar with). This task uses find_or_create_by, which keeps the process idempotent by avoiding duplicate entries if the data is already present.

The controller took some trial and error but was overall pretty basic. GeeksforGeeks recommended a retrieval method that would return more entries at once and sort the data entries as needed. I did run into 1 issue: intially, I created the controller and viewer basic files under thier respective directories, but a key component of the MVC pattern is the router that actually routes the commands to the right places. I also added a hash map with technician IDs as keys and their work orders as values, which made it easier to handle the user click behavior outlined in requirement 4.

The view took the most effort due to layout and styling issues. I chose to use divs instead of tables for flexibility, but I ran into a lot of  alignment issues like keeping rows consistent and ensuring click targets lined up correctly. I decided to resolve a lot of the issues I had with extending the padding at the bottom of the schedueler, which doesn't look the prettiest IMO, but is functional and still pretty clean. I also noticed the double bookings was another thing to consider. I used start/end times and my hashtable in the controller as a cache to detect overlaps. For display, I placed overlapping bookings side by side. There was also a grey area in how to treat overlapping time gaps (to how negative or zero time between jobs or treat them seperately). I decided the simplest solution was the best one and the requirements didn't have a specification on this so I treated them as seperate orders. I also added scroll behavior for very short bookings where text would overflow.

In terms for future improvements-- first I would want to clarify minute details before implementing them. One that stands out to me in terms of the viewer is the date; right now the webpage only displays a grid with time but there is no context outside of it (is it May? September? What year?). Another is an issue I already worked on but would want to improve– handling alignment with the div containers. 