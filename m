From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: getopt(3) redundancy/confusion?
Date: Wed, 25 Jan 2017 10:07:07 +1300
Message-ID: <CAKgNAkieOmRVPt24mH8pOvPFr7s+dpfx3kHSPBVyfu4ronxv=Q@mail.gmail.com>
References: <979857989.4058982.1485234629697.ref@mail.yahoo.com> <979857989.4058982.1485234629697@mail.yahoo.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <979857989.4058982.1485234629697-sAHhhX/85wgbqTNvkayDYw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Wiersba <jrw32982-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi John!

On 24 January 2017 at 18:10, John Wiersba <jrw32982-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:
> Hi, Michael!
>
> These two paragraphs in getopt(3) are confusing to me.  Isn't the first
> paragraph redundant (and incomplete), based on the second paragraph?
>
>        If getopt() does not recognize an option character, it prints an
>        error message to stderr, stores the character in optopt, and returns
>        '?'.  The calling program may prevent the error message by setting
>        opterr to 0.
>
>        If getopt() finds an option character in argv that was not included
>        in optstring, or if it detects a missing option argument, it returns
>        '?' and sets the external variable optopt to the actual option
>        character.  If the first character (following any optional '+' or '-'
>        described above) of optstring is a colon (':'), then getopt() returns
>        ':' instead of '?' to indicate a missing option argument.  If an
>        error was detected, and the first character of optstring is not a
>        colon, and the external variable opterr is nonzero (which is the
>        default), getopt() prints an error message.
>
> My understanding is that starting optstring with ":" is sufficient to
> prevent an option error being printed by getopt().
>
> If my comments are correct, then I can submit a bug report.

Yes, you're correct on all counts. I simply removed the first
paragraph. I'll give some thought to further clarifications. Thanks
for the report.

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
