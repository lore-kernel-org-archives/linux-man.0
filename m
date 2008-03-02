From: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Subject: Re: epoll design problems with common fork/exec patterns
Date: Sun, 2 Mar 2008 13:44:53 -0800 (PST)
Message-ID: <Pine.LNX.4.64.0803021342070.16600@alien.or.mcafeemobile.com>
References: <MDEHLPKNGKAHNMBLJOLKAEHCHNAC.davids@webmaster.com>
 <Pine.LNX.4.64.0710291147180.3387@alien.or.mcafeemobile.com>
 <47C42CA7.4030607@gmail.com> <Pine.LNX.4.64.0802261049040.27243@alien.or.mcafeemobile.com>
 <1204075804.5238.7.camel@linux.heathens.co.nz>
 <Pine.LNX.4.64.0802271131180.377@alien.or.mcafeemobile.com>
 <cfd18e0f0802280512q43a457d0sc9a8dc83c51e8e1c@mail.gmail.com>
 <Pine.LNX.4.64.0802281106050.7660@alien.or.mcafeemobile.com>
 <cfd18e0f0802290746p3cb7efc9j72394cd77ff37829@mail.gmail.com>
 <Pine.LNX.4.64.0802291111320.31028@alien.or.mcafeemobile.com>
 <cfd18e0f0802291154j612b4238i66cb8323b72814ca@mail.gmail.com>
 <cone.1204470717.369031.30230.500@commodore.email-scan.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cone.1204470717.369031.30230.500-lO+bjgoT4TKm14v+eVDVcBDJ/jce7dRH@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, =?X-UNKNOWN?Q?Chris_=C2=A5=C2=AF_Heath?= <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>, David Schwartz <davids-Rrbileazn+l54TAoqtyWWQ@public.gmane.org>, dada1-fPLkHRcR87vqlBn2x/YWAg@public.gmane.org, =?UTF-8?B?TGludXgtS2VybmVsQFZnZXIuIEtlcm5lbC4=?= Org <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, 2 Mar 2008, Sam Varshavchik wrote:

> Hijacking this epoll thread, the following related question occurs to me:
> 
> #Q8
> #    Does an operation on a file descriptor affect the already collected but
> #not yet reported events?
> #
> #A8
> #    You can do two operations on an existing file descriptor. Remove would
> #be meaningless for this case. Modify will re-read available I/O.
> 
> Why is EPOLL_CTL_DEL considered meaningless? A process is wrapping up its
> business and is preparing to remove the fd from the epoll set, and then close
> the file descriptor itself. In the meantime, the fd became readable, and a
> POLLIN event gets collected. So, what happens to the collected event, when the
> EPOLL_CTL_DEL operation is made?

Any epoll_wait() done after the POLLIN and before the EPOLL_CTL_DEL, will 
show up. After the EPOLL_CTL_DEL, of course, no events will be reported.



- Davide


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
