From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 57181] man pages for C structs
Date: Sat, 15 Mar 2014 16:25:34 +0000
Message-ID: <bug-57181-11311-AdVwUbgqg6@https.bugzilla.kernel.org/>
References: <bug-57181-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-57181-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=57181

--- Comment #4 from Serge van den Boom <serge+bugzilla.kernel.org-mibDF1kqFMcdnm+yROfE0A@public.gmane.org> ---
> So here's an example of ptroblem. 'struct timespec' is in 15 pages. Why point
> to this one in particular. I can see it's not a bad page to point to. But, if
> you are using one of the other APIs, then laning on nanosleep(2) would be
> confusing.

I am not singling out 'struct timespec'. In my opinion, we would benefit from
being able to use *any* structure name as a keyword to man. My list was
intended to show the wide variety of non-trivial structures which one might
want to look up.

You are right that if you are using one of the other functions, that landing up
on another one than the one which you are actually using, might sometimes be
confusing. And in fact, I would prefer to have a separate page for each
structure. However, even if you sometimes end up on a page of another function
which uses the same structure, this is better than having no match at all. At
the very least, it gives you a starting point for subsequent searches. And
often, you *will* end up at the right page. Or even if it is the wrong page,
the structure description will be usable.

For me, being able to press 'K' in Vim on some structure name to find out what
fields it has, is reason enough to want the structure name to lead somewhere.

> > [...]
> 
> I don't really buy this reasoning. If I'm using sendmsg(), then I'm probably on that page already before step 1.

Ok, this may not be the most realistic example, but the idea holds for any of
the structures. Maybe sockaddr_in works better for this example.

Also, having structures as man keywords doesn't just help with writing code,
but also with reading someone else's code. If you read code in the order in
which it occurs, you'll see the structure being filled before it is passed to
some syscall or C library function. In fact, the actual call may be in another
(user) function altogether. If you want to know more about what exactly those
values being assigned to the various fields mean, you just want to lookup the
structure name, instead of first having to figure out in what function it might
be used.

And I sometimes use these standard structures in my own code (why reinvent the
wheel?). In one real-life example, I needed to have some structure to store a
time period in, and I know that various standard types exist (struct timeval,
struct timespec, time_t), but I couldn't recall the details of each type. So to
find out which would be the most suitable, I would have had to think of various
standard functions which would use these types. (Though I might have ended up
grepping in /usr/include instead; I don't recall exactly. Maybe both even.)

But even though I'm now trying to think up all sorts of past and hypothetical
situations where it would be useful to be able to look up a structure by its
name, the reason why I originally took the time to write the bug report (and
the follow-ups now, a year later), is because I have in fact (on multiple
occasions) felt the need to perform such lookups. And if I have, so will have
others.

> Now, whether there should be separate pages for a few structures is something to think about more, but I'd need to see a good reason in each case. (sigevent(7) had a good reason, for example.)

I personally would like to be able to search for *every* standard structure,
and for typedefs too actually. Even if the resulting pages just contain a
reference to the pages of functions which actually use the type, this would be
of value. But ideally, the specifics of the fields would be explained there as
well.

I understand that this might be too much work to actually implement, but I do
think that the value is real. Maybe I'll even submit a patch myself one day, if
this is the situation.

Regards,

Serge

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
