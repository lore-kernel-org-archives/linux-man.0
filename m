From: chrubis-AlSwsSmVLrQ@public.gmane.org
Subject: Re: [PATCH] mmap.2: Add note about partial page in BUGS section
Date: Wed, 27 Feb 2013 15:10:33 +0100
Message-ID: <20130227141033.GA1797@rei>
References: <20121112112544.GC6764@rei.suse.cz>
 <CAKgNAkiK9FOSBsTuuC=kdkdg60z9WEAr67VEzubsJ065BCVCCQ@mail.gmail.com>
 <CAKgNAkjjtKkhrwqw4n-0C1oJOzSrF=3ducpb3K0ouo8BFVbEzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkjjtKkhrwqw4n-0C1oJOzSrF=3ducpb3K0ouo8BFVbEzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!
> I also tweaked the patch a little. The most notable change is that I
> changed your reference to "shm ipc" to "POSIX shared memory". Please
> let me know if that was incorrect.
> 
>        POSIX specifies that the system shall always zero fill any par???
>        tial  page  at the end of the object and that system will never
>        write any modification of the object beyond its end.  On Linux,
>        when  you  write data to such partial page after the end of the
>        object, the data stays in the page cache even after the file is
>        closed  and  unmapped and even though the data is never written
>        to the file itself, subsequent mappings may  see  the  modified
>        content.   In  some  cases,  this  could  be  fixed  by calling
>        msync(2) before the unmap takes place;  however,  this  doesn't
>        work  on  tmpfs  (for  example,  when using POSIX shared memory
>        interface documented in shm_overview(7)).

Thanks, that is better.

And out of curiosity, where is the most current man-pages git repo?

There seems to be github one and kernel.org one and they are out of
sync.

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
