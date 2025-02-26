## `ct.mouse.x`, `ct.mouse.y`

Current cursor position at horisontal and vertical axes. 

**Example: make a copy follow the cursor**

```js
this.x = ct.mouse.x;
this.y = ct.mouse.y;
```
> Note that this is a cursor position relative to the current view (or camera), but not relative to the room.

**Example: move a copy across a large room**

```js
this.x = ct.mouse.x + ct.rooms.current.x;
this.y = ct.mouse.y + ct.rooms.current.y;
```

## `ct.mouse.pressed`

Can be either `true` or `false`. Determines whether a mouse button was pressed.

**Example: create a bullet on mouse click**

```js
if (ct.mouse.pressed) {
    ct.types.make('Bullet',this.x,this.y);
}
```

*You should probably use [Actions](/actions.html) for this case.*

## `ct.mouse.down`

Can be either `true` or `false`. Determines whether a mouse button is held down.

## `ct.mouse.released`

Can be either `true` or `false`. Determines whether a mouse button was released.

## `ct.mouse.inside`

Can be either `true` or `false`. Determines whether there is a cursor inside the drawing canvas.

## `ct.mouse.hovers(copy)`

Returns `true` if the mouse hovers over a given `copy`. This does **not** take scaling and rotation into account, as well as polygonal shapes (as they are hollow).

## Codes for Actions

* `Left`;
* `Right`;
* `Middle`;
* `Wheel` (alternates between -1, 0 and 1);
* `Special1`;
* `Special2`;
* `Special3`;
* `Special4`;
* `Special5`;
* `Special6`.