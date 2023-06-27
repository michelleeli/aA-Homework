# Vanilla DOM Manipulation

Today you're going to practice manipulating the DOM using only vanilla
JavaScript! Let's get started.

Clone the starter repo from the `Download Project` button at the bottom of this
page. Check out the index file that's already been set up for you. You'll be
writing the __script.js__ file to manipulate that index page. Just open
__index.html__ in the browser and keep refreshing as you make changes.

As you will notice, only one of the interactive features is working. You can
cross restaurants off the list, but you can't add SF places of your own to visit
or add more photos of cute puppies. Time to employ some JavaScript!

## Phase I: Crossing off list items

This one has been done for you. Let's walk through it as an example.

In the __script.js__ file, notice that all of our DOM manipulation code has been
wrapped in an event listener. Can you think about why this is necessary? (Hint:
check out where the script tag is located in the HTML document.)

With the setup complete, you are free to write your JavaScript code directly in
the event listener's callback. No need to declare classes, constructors, etc. --
you're just writing stand-alone code that will be executed as soon as the DOM is
loaded.

Now look at the code for toggling restaurants. It first declares a function
`toggleLi` that takes in an `event`. Using that event, it then grabs the
`currentTarget` (i.e., the `<li>` that was clicked on) and toggles its
`className` to be either `visited` or `""`. Over in the CSS file, the class
`.visited` is set to have `line-through` its text. Because of this, all you have
to do to toggle the strikethrough appearance of the text is toggle the `<li>`'s
class to `visited` or not.

## Phase II: Adding list items

This one's a little trickier. You want to make it so that users can input a
place, click the submit button, and have the input box cleared / the new item
appended to the list. This is, in fact, almost exactly what one of the examples
in the DOM reading does. Check it out for guidance. Remember to use the class
names and IDs already set up in the HTML document!

## Phase III: Adding your own photos

Finally, update the last section to allow users to add their own photos of cute
puppies. Clicking the "Toggle new photo form" button should show or hide the
form to add a photo. When submitted, the form should then append a new list item
containing an `<img>` tag to the bottom of the puppy list. Because the
styling is already set, the photos should appear side by side. Don't forget that
you're appending an `<li>` that contains an `<img>` tag to the `<ul>`. You
should do this in multiple steps! Hint: what property do you want to set on the
new `<img>` tag once you've created it?
