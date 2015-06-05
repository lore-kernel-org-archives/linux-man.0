From: Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>
Subject: Re: statfs.2: f_spare[4]  or f_spare[5]
Date: Fri,  5 Jun 2015 15:44:51 -0700 (PDT)
Message-ID: <20150605224451.3B2E32C39E3@topped-with-meat.com>
References: <5453FE6F.3010501@redhat.com>
	<20141101035621.GH26840@vapier.wh0rd.info>
	<5454CB4C.6000805@redhat.com>
	<20141101153635.GB21263@vapier.wh0rd.info>
	<54D33A66.1080908@gmail.com>
	<20150215100814.GD32251@vapier>
	<54E83A3B.5030200@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: Michael Kerrisk (man-pages)'s message of  Saturday, 21 February 2015 08:56:43 +0100 <54E83A3B.5030200-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Sorry, I don't really remember any useful history about the use of
__fsword_t.  It's probably entirely reasonable to change the names we use
for these types in the libc headers (or even to change the actual type in
an ABI-compatible way, e.g. signedness changes).  Figuring out what makes
sense for the variety of ABIs we have today is probably sufficient without
figuring out the historical rationales.


Thanks,
Roland
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
