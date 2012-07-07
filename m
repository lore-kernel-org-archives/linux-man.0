From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: getifaddrs()
Date: Sat, 7 Jul 2012 08:20:18 +0200
Message-ID: <CAKgNAkjV87dXkLHTtEaYO_gyCcAjTHeLBesfz79q=uKCUumMcA@mail.gmail.com>
References: <4FF60812.70408@seclab.tuwien.ac.at> <20120706192945.GA15283@glenfiddich.mraw.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120706192945.GA15283-8MNqHwMchPhGJ/Ie3qa20WD2FQJk+8+b@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <simon.paillard-RGJHTEmuthQGuQl/6FzYuenJ6Cvpl5oe@public.gmane.org>
Cc: Adrian Dabrowski <atrox-qE3U7d0pukyEhLc4KmoMIOTv7YV0F9Eg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Jul 6, 2012 at 9:29 PM, Simon Paillard
<simon.paillard-RGJHTEmuthQGuQl/6FzYuenJ6Cvpl5oe@public.gmane.org> wrote:
> Hi,
>
> On Thu, Jul 05, 2012 at 11:33:06PM +0200, Adrian Dabrowski wrote:
>> Version: manpages-dev 3.27-1ubuntu2
>
> You should upgrade your manpages-dev version:
> http://packages.ubuntu.com/search?keywords=manpages-dev
>
>> The example program source produces a Seg-Fault, when a device does
>> not have an ifa->ifa_addr. (e.g. openvpn-tunnels, probably others
>> (dialup?))
>
> Thanks for reporting the issue, don't hesitate to report similar reports *that
> still apply in current version*.
>
>> ORIGINAL:
>>            for (ifa = ifaddr; ifa != NULL; ifa = ifa->ifa_next) {
>>                family = ifa->ifa_addr->sa_family;
>
> http://man7.org/linux/man-pages/man3/getifaddrs.3.html
>
>            for (ifa = ifaddr; ifa != NULL; ifa = ifa->ifa_next) {
>                if (ifa->ifa_addr == NULL)
>                    continue;
>
>                family = ifa->ifa_addr->sa_family;
>
> It has been fixed by
> http://git.kernel.org/?p=docs/man-pages/man-pages.git;a=commitdiff;h=ebd05fecfe
>
>> POSSIBLE FIX:
>>            for (ifa = ifaddr; ifa != NULL; ifa = ifa->ifa_next) {
>>               if (ifa->ifa_addr != NULL)
>>                               family = ifa->ifa_addr->sa_family;
>>               else
>>                       family = -1;
>>

Adrian, thanks for the note.

Simon, thanks for the review. From the above, I think nothing needs to
be applied, but:

>> Also it is not documented, that  struct sockaddr *ifa_addr  might be NULL.

I applied the following patch for 3.42:

[[
--- a/man3/getifaddrs.3
+++ b/man3/getifaddrs.3
@@ -98,20 +98,22 @@ for a list of these flags).
 The
 .I ifa_addr
 field points to a structure containing the interface address.
 (The
 .I sa_family
 subfield should be consulted to determine the format of the
 address structure.)
+This field may contain a NULL pointer.
 .PP
 The
 .I ifa_netmask
 field points to a structure containing the netmask associated with
 .IR ifa_addr ,
 if applicable for the address family.
+This field may contain a NULL pointer.
 .PP
 Depending on whether the bit
 .B IFF_BROADCAST
 or
 .B IFF_POINTOPOINT
 is set in
 .I ifa_flags
]]

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
