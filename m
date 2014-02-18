From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Changes.old: fix encoding issues
Date: Tue, 18 Feb 2014 09:54:06 +0100
Message-ID: <CAKgNAkgZ3RotoQ+G4jAgC=wauZdNjQVOgES79HEJWB8RstOctw@mail.gmail.com>
References: <1392558491-19116-1-git-send-email-spaillard@debian.org>
 <53020B87.5050408@gmail.com> <20140217153345.GU15288@mraw.org>
 <CAKgNAkjNSGA-p0ytpWNkBK84wf8pS3U0oMeFh9aZJjKiK8sDEw@mail.gmail.com>
 <CAMqf4EEO4uUeVu_bb64YtNqBYPa1dQMCzvwgM4GFeUEKY2d4WQ@mail.gmail.com>
 <CAKgNAkghN-Z_cwPAFk=VUdj8gME0GoRp0ta_uqdUHzc7MJ4y0w@mail.gmail.com> <CAKgNAkgVAW2xtaewWTiYYbBqCChChaxPj3pxrsX9k0wCUWL1mw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgVAW2xtaewWTiYYbBqCChChaxPj3pxrsX9k0wCUWL1mw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Feb 18, 2014 at 9:36 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Feb 18, 2014 at 7:49 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello Denis, Peter,
>>
>> On Mon, Feb 17, 2014 at 11:39 PM, D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 2014-02-17 16:44 GMT+01:00 Michael Kerrisk (man-pages) wrote:
>>>> On Mon, Feb 17, 2014 at 4:33 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
>>>>> On Mon, Feb 17, 2014 at 02:15:51PM +0100, Michael Kerrisk (man-pages) wrote:
>>>>>> On 02/16/2014 02:48 PM, Simon Paillard wrote:
>>>>>> > Introduced in 33972b0b231b9b0ee708f27fe42461dbca6e2968
>>>>>>
>>>>>> Bother! I still didn't get it right.
>>>>>>
>>>>>> Thanks for the patch! Applied.
>>>>>
>>>>> BTW, I check the rendering of the iso 8859 -11 and -13 manpages before/after
>>>>> the change and I think there is something to be fixed too.
>>>>
>>>> Oh -- that was automated with some scripts by Peter Schiffer, and the
>>>> results looked okay to me, but maybe I did not look closely enough.
>>>> What problems do you see?
>>>
>>> Hello,
>>>
>>> Simon is right, Peter's script handles iso_8859-{11,13}.7 in a
>>> different way, I do not understand why.
>>> You can fix them with:
>>>   for f in iso_8859-11 iso_8859-13; do
>>>     cp man7/$f.7 $f
>>>     iconv -f utf8 -t latin1 $f | iconv -f iso-${f#iso_} -t utf8 > man7/$f.7
>>>   done
>>
>> Denis, thanks for the scripts.
>>
>> Peter, perhaps we've missed something. Was there a reason to treat
>> iso_8859-{11,13}.7 differently?
>
> Got it. iconv(1) does not understand the some encoding names that
> start "iso_", but does understand the corresponding forms "iso-".
> Thus, iso_8859-11.7 and iso_8859-13.7 weren't acceptable, and Peter's
> script (mis-)worked around this. The correct approach, AFAICT is to
> use the forms iso-8859-11.7 and iso-8859-13.7. I committed a change to
> the script to fix that.
>
> Denis, I've applied your change.
>
> Simon, thanks for catching this.
>
> Peter, sorry I didn't better review the original change.

And, just to confirm: does what is now pushed to git look correct?

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
