From: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Subject: Re: epoll design problems with common fork/exec patterns
Date: Thu, 28 Feb 2008 11:34:08 -0800 (PST)
Message-ID: <Pine.LNX.4.64.0802281133020.7660@alien.or.mcafeemobile.com>
References: <MDEHLPKNGKAHNMBLJOLKAEHCHNAC.davids@webmaster.com>
 <Pine.LNX.4.64.0710291147180.3387@alien.or.mcafeemobile.com>
 <47C42CA7.4030607@gmail.com>  <Pine.LNX.4.64.0802261049040.27243@alien.or.mcafeemobile.com>
  <1204075804.5238.7.camel@linux.heathens.co.nz>
 <Pine.LNX.4.64.0802271131180.377@alien.or.mcafeemobile.com>
 <cfd18e0f0802280512q43a457d0sc9a8dc83c51e8e1c@mail.gmail.com>
 <cfd18e0f0802280523p1bdacfc5s274387f8280238c8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0802280523p1bdacfc5s274387f8280238c8-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: =?X-UNKNOWN?Q?Chris_=22=A5=AF=22_Heath?= <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>, David Schwartz <davids-Rrbileazn+l54TAoqtyWWQ@public.gmane.org>, dada1-fPLkHRcR87vqlBn2x/YWAg@public.gmane.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, 28 Feb 2008, Michael Kerrisk wrote:

> Davide,
> 
> with the earlier discussion in this thread in mind, I added a Q0/A0 to
> epoll.7, just make the point about keys clear:
> 
> 
>        Q0  What is the key used to distinguish the file descrip-
>            tors in an epoll set?
> 
>        A0  The key is the combination  of  the  file  descriptor
>            number  and  the open file description (also known as
>            "open file handle", the kernel's internal representa-
>            tion of an open file).
> 
> Does that seem okay?

Looks fine to me! We need to clarify better Q6 WRT fork().



- Davide


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
