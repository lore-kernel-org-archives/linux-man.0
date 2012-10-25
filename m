From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bug#633505: manpages-dev: fts(3) has inaccurate description of
 physical vs. logical
Date: Thu, 25 Oct 2012 12:35:54 +0200
Message-ID: <CAKgNAkhRd5KwczS_ZzbkN3J6UDXbS5cdK+H+apegwO3V-GHG=g@mail.gmail.com>
References: <20110710213043.7675.10278.reportbug@orbital.spiral-arm.org> <20120823202855.GA11044@glenfiddich.mraw.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120823202855.GA11044-8MNqHwMchPhGJ/Ie3qa20WD2FQJk+8+b@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 633505-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
Cc: James Youngman <jay-mXXj517/zsQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Aug 23, 2012 at 10:28 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> forwarded 633505 linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> thanks
>
> Hi,
>
> On Sun, Jul 10, 2011 at 10:30:43PM +0100, James Youngman wrote:
>> Package: manpages-dev
>> Version: 3.27-1
>> Severity: minor
>>
>>
>> The descriptions of the effects of FTS_LOGICAL and FTS_PHISICAL in the
>> subsection entitled fts_open() are correct.  But the DESCRIPTION
>> section is incorrect.  It says:
>>
>>   It is possible to walk the hierarchy "logically" (ignoring symbolic
>>   links) or physically (visiting symbolic links), order the walk of
>>   the hierarchy or prune and/or revisit portions of the hierarchy.
>>
>> This is not accurate.  Symbolic links are never ignored.  Here is a
>> clearer description:
>>
>>   It is possible to walk the hierarchy "logically" (visiting the files
>>   that symbolic links point to, like "find -L") or "physically"
>>   (visiting the symbolic links themselves instead, like "find -P") ,
>>   order the walk of the hierarchy or prune and/or revisit portions of
>>   the hierarchy.
>
> Thanks for the report James, confirmed by test, patch a bit modified and
> forwarded upstream.

Thanks Simon. Applied for 3.44.



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
