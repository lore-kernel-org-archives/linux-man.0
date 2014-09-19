From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Thread-safety of iconv()
Date: Thu, 18 Sep 2014 23:57:41 -0300
Message-ID: <ord2as8ggq.fsf@free.home>
References: <5416B235.8020309@redhat.com> <541A80BD.8050509@cn.fujitsu.com>
	<541ADAC1.2090108@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <541ADAC1.2090108-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> (Carlos O'Donell's message of "Thu,
	18 Sep 2014 09:14:41 -0400")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sep 18, 2014, "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> On 09/18/2014 02:50 AM, Peng Haitao wrote:
>> On 09/15/2014 05:32 PM, Marko Myllynen wrote:
>>> This looks a bit unclear, do you think you could clarify iconv(3) and/or
>>> iconv_open(3) a bit in thread-safety regard?

> It is conditionally thread safe :-)

It is MT-Safe, but it assumes callers arrange for mutual exclusion on
the cd object passed as argument.

It is no different from e.g. memset being MT-Safe, in spite of the race
when two threads call memset concurrently, writing to the same buffer.

It's caller's responsibility to avoid such races in both cases.

> Alex, please correct me if I'm wrong, but I think that sums it up.

Yup.  A recent blog post covers this issue (among others) in some
detail:

http://developerblog.redhat.com/2014/09/10/multi-thread-async-signal-and-async-cancel-safety-docs-in-gnu-libc/

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
