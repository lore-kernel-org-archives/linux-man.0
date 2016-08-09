From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [BUG][REPORT] Possible error in on man 7 glob
Date: Tue, 9 Aug 2016 17:25:15 +1200
Message-ID: <CAKgNAkgpVZBgcessTeSDKqUGsGZQtLh9zVVZa5Qx0jBj17rSpw@mail.gmail.com>
References: <CACH3jogB0J+3bvBSsSS=fBkqO=AydnVNdcAA-pijhK1bBOvKWA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACH3jogB0J+3bvBSsSS=fBkqO=AydnVNdcAA-pijhK1bBOvKWA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Gaillard <arnaud.mgaillard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, l-hour_q-ZrNlpQwM5lQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Arnaud,

On 9 August 2016 at 11:29, Arnaud Gaillard <arnaud.mgaillard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> the `man 7 glob` states that:
>
>>A range cannot contain an explicit '/' character;
>> this would lead to a syntax error.
>
> What I understand from this is that :
>
>> sh$ echo [/-a]
>> sh$ echo [a-/]
>
> should be producing syntax errors. However, this is not the case,
> as these just print out literally.
>
>> sh$ uname -a
> Linux caml 3.19.0-25-generic #26~14.04.1-Ubuntu SMP \
> Fri Jul 24 21:16:20 UTC \
> 2015 x86_64 x86_64 x86_64 GNU/Linux \
>
> This was tested on:
>
> * bash: GNU bash, version 4.3.11(1)-release (x86_64-pc-linux-gnu)
> * tcsh: tcsh 6.19.00 (Astron)
> * ksh: sh (AT&T Research) 93u

Further down the page, there is a statement: "However, POSIX requires
that a wildcard pattern is left unchanged when it is syntactically
incorrect". So, the point is that a syntactically incorrect pattern
doesn't cause an error, it simply doesn't glob. But I agree that the
text you cite is a little confusing. So I changed the text there to:

       A range containing an explicit  '/'  character  is
       syntactically  incorrect.  (POSIX requires that syntactically incorrect
       patterns are left unchanged.)

Hopefully, that lessens the scope for misreading.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
