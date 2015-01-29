From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] cfree.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 29 Jan 2015 09:31:17 +0800
Message-ID: <54C98D65.9050100@cn.fujitsu.com>
References: <1422425343-20809-1-git-send-email-mashimiao.fnst@cn.fujitsu.com> <54C8C28F.2040107@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54C8C28F.2040107-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,
On 01/28/2015 07:05 PM, Michael Kerrisk (man-pages) wrote:
>> +.BR attributes (7).
>> > +.TS
>> > +allbox;
>> > +lb lb lb
>> > +l l l.
>> > +Interface	Attribute	Value
>> > +T{
>> > +.BR cfree ()
>> > +T}	Thread safety	MT-Safe /* In glibc */
> What is the "?* In glibc */" for?
This page records different versions of cfree.
Like cfree in SunOS 4, SCO OpenServer, glibc and so on.
I just can confirm thread safety of cfree in glibc.
So, I added a comment to help users understand which cfree 
I'm declaring.

Did I miss something or any good ideas?


Best regards
-- 
Ma Shimiao
Development Dept.I
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
