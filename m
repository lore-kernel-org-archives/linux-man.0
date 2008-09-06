From: "Timothy S. Nelson" <wayland-r28gBBs99rhWo+R/V/U2/g@public.gmane.org>
Subject: Re: [patch] hsearch.3: Reorder entire page for readability, add
 information for completeness
Date: Sat, 6 Sep 2008 14:05:43 +1000 (EST)
Message-ID: <alpine.LRH.1.10.0809061404250.19404@gwalcmai.nelson.org.au>
References: <alpine.LRH.1.10.0809021415510.3454@gwalcmai.nelson.org.au> <48BD4B48.3080108@gmail.com> <alpine.LRH.1.10.0809030829530.3410@gwalcmai.nelson.org.au> <48BE4195.8000703@gmail.com> <alpine.LRH.1.10.0809041436440.5125@gwalcmai.nelson.org.au>
 <cfd18e0f0809050311x7d37729ci2408563ccd74b4c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0809050311x7d37729ci2408563ccd74b4c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, 5 Sep 2008, Michael Kerrisk wrote:

>>> If it didn't work for you then you probably didn't define the FTM before
>>> including *any* header file.  Including <features.h> should never be
>>> necessary.
>
> Please read the preceding paragraph carefully.  The same information
> is provided in the second paragraph of  feature_test_macros(7), which
> I already suggested you read a couple of times.

 	Ouch!  Thanks.  I looked at that page, but just skipped to the 
_GNU_SOURCE section :).  Now I understand what needs to happen.  Thanks.


---------------------------------------------------------------------
| Name: Tim Nelson                 | Because the Creator is,        |
| E-mail: wayland-r28gBBs99rhWo+R/V/U2/g@public.gmane.org    | I am                           |
---------------------------------------------------------------------

----BEGIN GEEK CODE BLOCK----
Version 3.12
GCS d+++ s+: a- C++$ U+++$ P+++$ L+++ E- W+ N+ w--- V- 
PE(+) Y+>++ PGP->+++ R(+) !tv b++ DI++++ D G+ e++>++++ h! y-
-----END GEEK CODE BLOCK-----

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
