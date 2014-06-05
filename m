From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Very bad advice in man 2 dup2
Date: Thu, 5 Jun 2014 14:54:49 +0200
Message-ID: <CAKgNAkhFJ6-_RKfTFXYxAAU3jw-ij9ojgeO9G=V9L-WgKZQ62w@mail.gmail.com>
References: <20140529210242.GP507@brightrain.aerifal.cx> <53884C27.7020207@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53884C27.7020207-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Rich, Ping!

On Fri, May 30, 2014 at 11:15 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Rich,
>
> For discussions like this, it really is very important to CC the list=
,
> so that there's an archived record of the reasons for the change.
> I've concatenated your two mails below.
>
> I agree that the page needs to be fixed; thanks for the report!
> I am mulling over what the best fix is. One proposal below.
>
> On 05/29/2014 11:02 PM, Rich Felker wrote:
>> Hi,
>>
>> The following text appears in the man page for dup2 and dup3:
>>
>>     If newfd was open, any errors that would have been reported at
>>     close(2) time are lost. A careful programmer will not use dup2()
>>     or dup3() without closing newfd first.
>>
>> Such use of close is very bad advice, as it introduces a race
>> condition during which the file descriptor could be re-assigned and
>> subsequently clobbered by dup2/dup3.
>
> Agreed. A more fundamental problem in the man page is that
> it does not mention the atomicity of dup2() (and dup3()),
> and why that is needed to avoid the race condition.
> I'll add some words on that.
>
>> This type of bug can lead to
>> serious data leaks and/or data loss. The whole point of dup2/dup3 is
>> to _atomically_ replace a file descriptor.
>>
>> For the most part there are no meaningful errors which close can
>> return, probably only obscure NFS behavior with bad caching settings
>> which are really not handlable by applications anyway, so I feel it
>> would be best to just drop this text (or find a way to detect such
>> errors without close, perhaps using fsync, and recommend that).
>
> On 05/30/2014 07:23 AM, Rich Felker wrote:
> [...]
>> Here is a proposed alternate text that was recommended to me by a us=
er
>> on Stack Overflow:
>
> It'd be great to add URLs when citing such discussions... With some
> effort, I found
> http://stackoverflow.com/questions/23440216/race-condition-when-using=
-dup
>
>>     A careful programmer will first dup() the target descriptor, the=
n
>>     use dup2()/dup3() to replace the target descriptor atomically, a=
nd
>>     finally close the initially duplicated target descriptor. This
>>     replaces the target descriptor atomically, but also retains a
>>     duplicate for closing so that close-time errors may be checked
>>     for. (In Linux, close() should only be called once, as the
>>     referred to descriptor is always closed, even in case of
>>     errno=3D=3DEINTR.)
>>
>> I'm not sure this is the best wording, since it suggests doing a lot
>> of work that's likely overkill (and useless in the case where the
>> target descriptor was read-only, for instance). I might balance such
>> text with a warning that it's an error to use dup2 or dup3 when the
>> target descriptor is not known to be open unless you know the code
>> will only be used in single-threaded programs. And I'm a little bit
>> hesitant on the parenthetical text about close() since the behavior
>> it's documenting is contrary to the requirements of the upcoming iss=
ue
>> 8 of POSIX,
>
> Again citing the Issue 8 discussion would be helpful. Could
> you tell me where it is? (It could be useful for the change log.)
>
>> and rather irrelevant since EINTR cannot happen in Linux's
>> close() except with custom device drivers anyway.
>
> So, how about something like the following (code not
> compile-tested...):
>
>        If newfd was open, any errors that would have been reported  a=
t
>        close(2) time are lost.  If this is of concern, then=E2=80=94u=
nless the
>        program is single-threaded and does not allocate file  descrip=
=E2=80=90
>        tors  in  signal  handlers=E2=80=94the correct approach is not=
 to close
>        newfd before calling dup2(),  because  of  the  race  conditio=
n
>        described  above.   Instead,  code something like the followin=
g
>        could be used:
>
>            /* Obtain a duplicate of 'newfd' that can subsequently
>               be used to check for close() errors; an EBADF error
>               means that 'newfd' was not open. */
>
>            tmpfd =3D dup(newfd);
>            if (tmpfd =3D=3D -1 && errno !=3D EBADF) {
>                /* Handle unexpected dup() error */
>            }
>
>            /* Atomically duplicate 'oldfd' on 'newfd' */
>
>            if (dup2(oldfd, newfd) =3D=3D -1) {
>                /* Handle dup2() error */
>            }
>
>            /* Now check for close() errors on the file originally
>               referred to by 'newfd' */
>
>            if (tmpfd !=3D -1) {
>                if (close(tmpfd) =3D=3D -1) {
>                    /* Handle errors from close */
>                }
>            }
>
> Cheers,
>
> Michael
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
