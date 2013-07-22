From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] open(2): document O_PATH
Date: Mon, 22 Jul 2013 10:46:30 +0200
Message-ID: <51ECF166.4080007@redhat.com>
References: <CAKgNAkgWiANFA1Z7o2EQmKmsMzzpa1ga2ggLeX3Bo58QmjDx6g@mail.gmail.com> <20130720114017.GA2118@ZenIV.linux.org.uk> <51EAF997.2090300@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51EAF997.2090300-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>, "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, benjamin-+ZN9ApsXKcEdnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/20/2013 10:56 PM, Michael Kerrisk wrote:
> On 07/20/13 13:40, Al Viro wrote:
>> On Thu, Mar 14, 2013 at 10:35:59AM +0100, Michael Kerrisk (man-pages) wrote:
>>> Hello Al et al,
>>>
>>> Documenting O_PATH fell by the wayside last year
>>> (http://thread.gmane.org/gmane.linux.man/2790) as I got distracted
>>> with other tasks. A recent prod or two have reminded me restart this.
>>> I have the following patch queued to document O_PATH.
>>>
>>> Could you please review. I've provided the O_PATH doc both as
>>> formatted text, for ease of reviewing, and as a patch and entire file
>>> (attached).
>>
>> Seems to be mostly correct; the only thing missing is that F_GETFL is also
>> allowed (and return value will contain O_PATH for such descriptors).  Had
>> been there since the very beginning...
>
> Thanks, Al. I have added that piece.
>

Michael,

there is a typo within added piece:

diff --git a/man2/open.2 b/man2/open.2
index c61ea7f..ef0f664 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -489,7 +489,7 @@ and
  .IP *
  Retrieving open file status flags using the
  .BR fcntl (2)
-.BR F_GETFD
+.BR F_GETFL
  operation: the returned flags will include the bit
  .BR O_PATH .


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
