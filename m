From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: iNotify Man Page: Prefix Header + Tail Array vs C Structure
Date: Sun, 13 Dec 2015 18:53:18 +0100
Message-ID: <566DB08E.6090305@bfs.de>
References: <566D6009.7050409@o2online.de>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <566D6009.7050409-X3bqsT2AMO4b1SvskN2V4Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Titke <michael.tiedtke-X3bqsT2AMO4b1SvskN2V4Q@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I am not sure that i understood what you want ...

i would answer the question:

* what is the actual size of struct inotify_event ?

inotify(7) says:
the length of each inotify_event structure is thus sizeof(struct inotify_event)+len

hope that helps ..

re,
 wh

Am 13.12.2015 13:09, schrieb Michael Titke:
> Hello!
> 
> The current version of the manual page describing /inotify/ (as well as
> the version installed with Ubuntu 15.04 frozen to Violet Indigo)
> contains a descriptive C structure describing the /inotify//messages/:
> 
>            struct inotify_event {
>                int      wd;       /* Watch descriptor */
>                uint32_t mask;     /* Mask describing event */
>                uint32_t cookie;   /* Unique cookie associating related
>                                      events (for rename(2)) */
>                uint32_t len;      /* Size of name field */
>                char     name[];   /* Optional null-terminated name */
>            };
> 
> As part of the development of VSI I translated the above structure
> without much thinking into a corresponding byte structure description:
> 
> (define inotify-event-header
>   (byte-structure-description
>    (wd   int)
>    (mask   4) ; [sic! that was an uint32]
>    (cookie 4)
>    (len    4)
>    ;(name   pointer) ; That's not a pointer but an array: NAME_MAX + 1
> ))
> 
> Now while the prefix (or header) of the message is described adequately
> the specification of the tail array as a char name[] would in C be
> interpreted as a pointer onto a char. One might insert a length
> parameter like char name[NAME_MAX + 1] or exclude that tail array from
> the structure and describe the message in terms of /prefix/ or /header/
> and /tail array/.
> 
>            struct inotify_event {
>                int      wd;       /* Watch descriptor */
>                uint32_t mask;     /* Mask describing event */
>                uint32_t cookie;   /* Unique cookie associating related
>                                      events (for rename(2)) */
>                uint32_t len;      /* Size of name field */
>                char     name[NAME_MAX + 1];   /* Optional
> null-terminated name */
>            };
> 
> With that length parameter in the structure the size of the messages is
> described adequately but the actual length of the name might be confused
> with the maximum size which usually includes some (tail) padding.
> 
> I'm sorry but I don't know enough about /iNotify/ to craft a patch for
> this. Is this a datagram channel where half-read messages will vanish?
> Perhaps I should continue reading the manual page. :-)
> 
> Regards,
> Michael
> 
> -- 
> VSI: https://code.launchpad.net/viper-system-interface
> 
>  (reason: 550 5.7.1 Content-Policy reject msg: The message contains HTML
> subpart, therefore we consider it SPAM or Outlook Virus.  TEXT/PLAIN is
> accepted.! BF:<U
> 
> 
> PS That's not really up to the standard but "... since hosts aren't
> required to relay mail at all ..." someone presumes something.
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
