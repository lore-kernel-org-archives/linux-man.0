From: Maxin John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] removing EINVAL error from cacheflush() man page
Date: Thu, 7 May 2009 19:59:12 +0530
Message-ID: <9debc4410905070729i7a641ccq1f0d062f0dbd468a@mail.gmail.com>
References: <9debc4410905070240w63b20e9q35e5e6d5f9c3f6e4@mail.gmail.com>
	 <20090507110845.GA7567@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090507110845.GA7567-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Dear Mr.Ralf,

>On Thu, May 7, 2009 at 4:38 PM, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org> wrote:
>> On Thu, May 07, 2009 at 03:10:19PM +0530, Maxin John wrote:

Thank you very much for modifying the cacheflush() man page.

>      Linux on several other architectures does support a  cacheflush()  sys-
>       tems call but with different arguments.

In LTP mailing list, Mr.Carmelo has reported that sh4 architecture
supports sys_cacheflush syscall:
http://www.mail-archive.com/ltp-list-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org/msg06430.html

Thanks once again for modifying the man page. The modified
cacheflush() man page makes me happier :)

Best Regards,
Maxin B. John
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
