From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc(5): fix indentation for net examples
Date: Thu, 02 Jan 2014 08:48:25 +1300
Message-ID: <52C47109.2000708@gmail.com>
References: <1388237204-12791-1-git-send-email-vapier@gentoo.org> <52C15897.5060309@gmail.com> <201312310043.48914.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201312310043.48914.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/31/13 18:43, Mike Frysinger wrote:
> On Monday 30 December 2013 06:27:19 Michael Kerrisk (man-pages) wrote:
>> On 12/29/13 02:26, Mike Frysinger wrote:
>>> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
>>
>> I'm not sure what the goal of this change is. What's broken?
>> (Note that there is some value, in terms of easy parsing of
>> man output, to having only the section headings start in
>> column 1.)
> 
> i'm not sure what you mean here.  having it at col 1 makes scanning the man 
> page harder imo, and indenting it to match the content that it's part of makes 
> sense.  it's what most every other section does in this man page already.
> 
> if you're worried about 80 cols, then this table already widely exceeds that 
> limit even when placed at col 1.  so fixing the indentation doesn't really hurt 
> that scenario.
> -mike

I misread your patch somewhat. However, I prefer to keep things the way they
are, for a couple of reasons. First, these sort of adjustments do allow some
of the other tables to fit in 80 columns where they would not otherwise do so.
Second, they reduce the min. width of the terminal window that is required 
to properly display the tables.

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
