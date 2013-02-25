From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mmap.2: Add note about partial page in BUGS section
Date: Mon, 25 Feb 2013 09:05:57 +0100
Message-ID: <CAKgNAkjjtKkhrwqw4n-0C1oJOzSrF=3ducpb3K0ouo8BFVbEzQ@mail.gmail.com>
References: <20121112112544.GC6764@rei.suse.cz> <CAKgNAkiK9FOSBsTuuC=kdkdg60z9WEAr67VEzubsJ065BCVCCQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiK9FOSBsTuuC=kdkdg60z9WEAr67VEzubsJ065BCVCCQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: chrubis-AlSwsSmVLrQ@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Feb 25, 2013 at 9:00 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Cyril,
>
> On Mon, Nov 12, 2012 at 12:25 PM,  <chrubis-AlSwsSmVLrQ@public.gmane.org> wrote:
>> Hi!
>> This adds note about Linux behavior with partial page at the end of =
the
>> object. The problem here is that pages that contains only part of a
>> file (because the file size is not multiple of PAGE_SIZE) stays in p=
age
>> cache even after the mapping is unmapped and the file closed. So if =
some
>> proces dirties such page other mappings will see the the changes rat=
her
>> than zeroes.
>>
>> I've also attached reproducer which is a stripped down version of LT=
P
>> test. The child creates file of the size of PAGE_SIZE/2, maps it,
>> changes content after the PAGE_SIZE/2. The parent waits for child to
>> exit, maps the same file and checks the content after the PAGE_SIZE/=
2.
>> Uncommenting the msync() makes the test succeed.
>
> Thanks. And thanks also for the test program. I've applied this patch=
=2E

I also tweaked the patch a little. The most notable change is that I
changed your reference to "shm ipc" to "POSIX shared memory". Please
let me know if that was incorrect.

       POSIX specifies that the system shall always zero fill any par=E2=
=80=90
       tial  page  at the end of the object and that system will never
       write any modification of the object beyond its end.  On Linux,
       when  you  write data to such partial page after the end of the
       object, the data stays in the page cache even after the file is
       closed  and  unmapped and even though the data is never written
       to the file itself, subsequent mappings may  see  the  modified
       content.   In  some  cases,  this  could  be  fixed  by calling
       msync(2) before the unmap takes place;  however,  this  doesn't
       work  on  tmpfs  (for  example,  when using POSIX shared memory
       interface documented in shm_overview(7)).

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
