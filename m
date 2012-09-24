From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] wait4.2: Add a note that these functions are deprecated
Date: Mon, 24 Sep 2012 07:16:28 +0200
Message-ID: <CAKgNAkio1wJeZ9wr=PGO5zw-h6BkY4tNHG0y=5wvGeVRNwhr2Q@mail.gmail.com>
References: <20120918210116.GA22808@bunk.dyndns.info> <CAKgNAkiiNGhVRi-ddBA2t8tdZMRq_rrJWEAumVyXikZCzCW1UA@mail.gmail.com>
 <20120923142425.GC13319@bunk.dyndns.info> <CAKgNAkiHYrerfCDab8UFrFZbqd=jEBXScLjM2j7LHAJHLnNhmg@mail.gmail.com>
 <20120923152512.GD13319@bunk.dyndns.info>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120923152512.GD13319-c9qLp6CXzmZPEsXTsnYjsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

>> >> I think the idea of your patch is good, but I prefer to use a word
>> >> other than "deprecated". The problem is that "deprecated" implies a
>> >> standards body or a vendor made a formal statement about this. It's
>> >> true that LSB 2.1 says that wait3() is deprecated
>> >> (http://refspecs.linuxbase.org/LSB_2.1.0/LSB-generic/LSB-generic/baselib-wait3-3.html),
>> >> but wait4() is currently still part of LSB. So, I applied a slightly
>> >>
>> >> modified version of your test:
>> >>
>> >> [[
>> >> These functions are nonstandard; use
>> >>
>> >> .BR waitpid (2)
>> >> or
>> >> .BR waitid (2)
>> >> in new programs.
>> >> ]]
>> >>
>> >> Seem okay?
>> >
>> > the wait3() function is not "nonstandard, since as the URL you gave
>> > correctly states it is part of SuSv2 (and also of SuSv1).
>>
>> Yep, but marked LEGACY in SUSv2, and removed altogether in SUSv3. So,
>> not part of contemporary standard. (BTW, I did also add text under
>> CONFORMING TO to note those details.) So, I think I'll leave the text
>> as I gave already, unless you have a better alternative to propose.
>
> My problem is with the word "nonstandard" for wait3(), that was
> specified in older standards.
>
> What about "obsolete" instead?

Okay -- done!

Cheers,

Michael




-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
