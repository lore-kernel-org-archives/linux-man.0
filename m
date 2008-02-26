From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Duplicated text in getaddrinfo(3)
Date: Tue, 26 Feb 2008 16:12:07 +0100
Message-ID: <47C42C47.6060708@gmail.com>
References: <cone.1203900386.880941.11463.500@commodore.email-scan.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cone.1203900386.880941.11463.500-lO+bjgoT4TKm14v+eVDVcBDJ/jce7dRH@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Sam,

Sam Varshavchik wrote:
> The current version of getaddrinfo(3) seems to have some a small amount
> of duplicative text, possibly a small cut-paste fudge.

Not sure.  It seems this text goes back to the (your) original version of
the page.  (To begin with, I had wondered if I'd messed up on some edits
that I later made to the page.)

> Describing the results placed into the returned addrinfo struct:
> 
> The members
> .IR ai_family ,
> .IR ai_socktype ,
> and
> .I ai_protocol
> have the same meaning as the corresponding parameters in the
> .BR socket (2)
> system call.
> 
> 
> Then, two paragraphs later:
> 
> .IR ai_family ,
> .IR ai_socktype ,
> and
> .I ai_protocol
> specify the socket creation parameters.
> 
> Even those the immediately preceding sentence refers to the hints input
> parameter, this sentence seems to refer to the output addrinfo struct
> again, and just restates the description given two paragraphs earlier.

Yep -- I've consolidated the duplicated text into a single sentence, and
also removed a bit of duplications elsewhere.  I also rewrote the
discussion of hints==NULL a bit, to provide some more detail.

Chnages will be in 2.79.

thanks!

Michael

-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
