From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: [PATCH] new Page: isalpha__3(3)
Date: Wed, 12 Mar 2014 19:34:27 +0100
Message-ID: <5320A8B3.1030101@bfs.de>
References: <5315F2B5.2040009@bfs.de> <531DBD1F.5090400@gmail.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <531DBD1F.5090400-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org



Am 10.03.2014 14:24, schrieb Michael Kerrisk (man-pages):

> 
> Hello Walter,
> 
> You've submitted a number of pages over the past months that I have
> not found the energy to review. I respond to this submission, with 
> the goal of explaining why, since it shows many of the problems that
> I see in the other submissions (and, in several cases, problems that
> I have commented on in your past submissions).

My major problem was i got no reply at all and was wondering if the page
arrived in the ml at all.
I shortened the mail a bit.
Since you made a new page, most stuff is now obsolete but i would like
to explain a few things i did.



>> .SH CONFORMING TO
>> POSIX.1-2008 specifies all of these functions.
>> .SH NOTES
>> The details of what characters belong into which class depend on the current
>> locale.
>> .sp
>> from
>> .IR locale.h :
>> The concept of one static locale per category is not very well
>> thought out.  Many applications will need to process its data using
>> information from several different locales.  Another application is
>> the implementation of the internationalization handling in the
>> upcoming ISO C++ standard library.  To support this another set of
>> the functions using locale data exist which have an additional
>> argument.
> 
> Simply quoting this text from locale.h without explanation does not
> really add much to the description. The point is that the *_l
> pages are designed to address the limitation that the traditional
> locale APIs do not mix well with multi-threaded applications
> and with applications that must deal with multiple locales.
> A general statement to that effect needs to appear somewhere, though
> probably not on this page. (I'll add something to locale(7).)

For me that was very clear at that time since i had exactly that
problem, i needed two locale internally for parsing, no need for threads.
For me that illustrated the intention of the original author, therefore
it went into notes.

> 
>> For example,
>> .BR isupper ()
>> will not recognize an A-umlaut (\(:A) as an uppercase letter in the default
>> .B "C"
>> locale.
> 
> Problem: The sentence above relates to a function not even in the 
> SYNOPSIS of this page.
> 

yes, bad example, the basic idea was to describe that some function
depend on a certain locale.


> But, more to the point, the program appears to be broken, if you are
> operating in a UTF-8 locale, which I assume you are. I suppose 
> the program does work if you are operating in an iso-8859-1 locale
> (though that seems an unlikely set-up these days), but that
> point would need some careful explanation in the man page, or some 
> clarification in a shell session log that shows a run of the program,
> otherwise the program would cause much confusion for people on UTF-8 
> systems.

I use 8859-1 and i guess that is the reason i did not see any problems.
But i am really wondering why i missed the -Wall point.

> 
> Functions such as isalnum_l() can't be applied to UTF-8 characters.
> POSIX seems clear:
> 
>        The  c argument is an int, the value of which the application
>        shall ensure is representable as an unsigned char or equal to
>        the  value  of  the  macro EOF. If the argument has any other
>        value, the behavior is undefined.
> 
> (It would have been useful to see sample output from your program as 
> part of the man page, as a help to the reader, but also as a check of
> what you believe is happening, and what locale you are working with.) 
> 
> Instead, a conversion to wide characters is needed (mbstowcs(3)), and
> then the use of the isw*_l() functions. See my example, further down.

I found isw*_l() also while figuring out what to do with isalpha_l and friends.


> ==
> 
> Now, to be clear: many page submissions that I receive fail on some
> of the points mentioned above, but this page fails on multiple counts.
> 
> In summary... Walter, you are often good at finding things that need to 
> be documented, and I know your work is well intended. However, the pages
> you submit often require so much review/repair effort (in some cases, 
> initial drafts of pages appear not to even have been run through a spell
> checker, though this page seems okay), that it is often faster to write
> the pages myself. And some of the same problems that I comment on in
> earlier submissions turn up again in new submissions. Thus, it is hard 
> for me to find the enthusiasm to review these pages myself (and I have
> in any case very limited bandwidth) and help them get repaired (and 
> it's rare that others step in, though I noticed that Stefan Puiu did 
> take a shot on one of your submissions). I do not know what the solution 
> is here, but this mail explains the problems from my side, and why 
> I'm often unresponsive / slow to respond to your submissions (and 
> am likely to remain so, unless something changes).

I admit that i underestimated the complexity of the these locale stuff.
I can only say i tried to document what was not documented and add an
example basically showing how i came to that conclusion and how it works.

> same problems that I comment in earlier submissions

Sorry about that that i always try to get better, the wired thing is
i can not find anything in my mailarchive. I found i send some pages
years ago what i can not find is any reply, with one exception
a typo in sem_wait.3.
Serious, i can not remember what happened, did i ever send a reply ?

And important, i guess the ISWALPHA_L page has the same defects as it is a direct
derivative of ISALPHA_L.

NTL it seems there are a lot more _l functions, i did not check if there
is a page but you may like to add some of them to undocumented(3):
see: http://www.freebsd.org/cgi/man.cgi?query=xlocale&sektion=3

sorry for the trouble,
wh


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
