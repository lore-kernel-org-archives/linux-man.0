From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ip.7: Adding source-specific multicast sockopts
Date: Sun, 10 Feb 2013 03:47:58 +0100
Message-ID: <CAKgNAkgqRmn+LrcesGF0RP5GWuOX=o76EC1_oBt8749k9Foh4w@mail.gmail.com>
References: <1342203826-16969-1-git-send-email-rpazdera@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1342203826-16969-1-git-send-email-rpazdera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rpazdera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Radek,

On Fri, Jul 13, 2012 at 8:23 PM,  <rpazdera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> From: Radek Pazdera <rpazdera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> This patch adds documentation of several source-specific multicast
> socket options that were added to kernel with implementation
> of IGMPv3 in 2.5.68.
>
> The following socket options were added:
>   IP_ADD_SOURCE_MEMBERSHIP
>   IP_DROP_SOURCE_MEMBERSHIP
>   IP_BLOCK_SOURCE
>   IP_UNBLOCK_SOURCE
>   IP_MSFILTER
>
> Information Sources:
>   * RFC 3376 - Internet Group Management Protocol, Version 3
>       http://tools.ietf.org/html/rfc3376
>   * RFC 3678 - Socket Interface Extensions for Multicast Source Filters
>       http://tools.ietf.org/html/rfc3678
>   * Kernel source tree
>       net/ipv4/ip_sockglue.c
>       net/ipv4/igmp.c
>   * Test programs used in Linux Network Stack Test
>       http://git.fedorahosted.org/git/?p=lnst.git
>       test_tools/multicast/
>
> Signed-off-by: Radek Pazdera <rpazdera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Well after the fact, I've applied this patch. Thank you for sending it.

Cheers,

Michael

> ---
>  man7/ip.7 |  115 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>
> diff --git a/man7/ip.7 b/man7/ip.7
> index 9f560df..842dd3b 100644
> --- a/man7/ip.7
> +++ b/man7/ip.7
> @@ -256,6 +256,58 @@ Only valid as a
>  .BR setsockopt (2).
>  .\"
>  .TP
> +.BR IP_ADD_SOURCE_MEMBERSHIP " (since Linux 2.5.68)"
> +Join a multicast group and allow receiving data only
> +from a specified source.
> +Argument is an
> +.I ip_mreq_source
> +structure.
> +.sp
> +.in +4n
> +.nf
> +struct ip_mreq_source {
> +    struct in_addr imr_multiaddr;  /* IP multicast group
> +                                      address */
> +    struct in_addr imr_interface;  /* IP address of local
> +                                      interface */
> +    struct in_addr imr_sourceaddr; /* IP address of
> +                                      multicast source */
> +};
> +.fi
> +.in
> +.sp
> +.I ip_mreq_source
> +structure is similar to
> +.I ip_mreqn
> +described at
> +.BR IP_ADD_MEMBERSIP .
> +.I imr_multiaddr
> +contains the address of the multicast group the application
> +wants to join or leave.
> +.I imr_interface
> +is the address of the local interface with which
> +the system should join the multicast group.
> +Finally
> +.I imr_sourceaddr
> +field contains address of the source the
> +application wants to receive data from.
> +.IP
> +This option can be used multiple times to allow
> +receiving data from more than one source.
> +.TP
> +.BR IP_BLOCK_SOURCE " (since Linux 2.5.68)"
> +Stop receiving multicast data from a specific source in a given
> +group. This is valid only after the application has subscribed
> +to the multicast group using either
> +.BR IP_ADD_MEMBERSHIP
> +or
> +.BR IP_ADD_SOURCE_MEMBERSHIP .
> +.IP
> +Argument is an
> +.I ip_mreq_source
> +structure as described at
> +.BR IP_ADD_SOURCE_MEMBERSHIP .
> +.TP
>  .BR IP_DROP_MEMBERSHIP " (since Linux 1.2)"
>  Leave a multicast group.
>  Argument is an
> @@ -265,6 +317,19 @@ or
>  structure similar to
>  .BR IP_ADD_MEMBERSHIP .
>  .TP
> +.BR IP_DROP_SOURCE_MEMBERSHIP " (since Linux 2.5.68)"
> +Leave a source-specific group, i.e., stop receiving data from
> +a given multicast group that come from a given source).
> +If the application has subscribed to multiple sources within
> +the same group, data from the remaining sources will still be
> +delivered. To stop receiving data from all sources at once use
> +.BR IP_LEAVE_GROUP .
> +.IP
> +Argument is an
> +.I ip_mreq_source
> +structure as described at
> +.BR IP_ADD_SOURCE_MEMBERSHIP .
> +.TP
>  .BR IP_FREEBIND " (since Linux 2.4)"
>  .\" Precisely: 2.4.0-test10
>  If enabled, this boolean option allows binding to an IP address
> @@ -293,6 +358,45 @@ When this flag is enabled the values set by
>  and
>  .B IP_TOS
>  are ignored.
> +.TP
> +.BR IP_MSFILTER " (since Linux 2.5.68)"
> +This option provides access to the advanced full-state filtering API.
> +Argument is an
> +.I ip_msfilter
> +structure.
> +.sp
> +.in +4n
> +.nf
> +struct ip_msfilter {
> +    struct in_addr imsf_multiaddr; /* IP multicast group
> +                                      address */
> +    struct in_addr imsf_interface; /* IP address of local
> +                                      interface */
> +    uint32_t       imsf_fmode;     /* Filter-mode */
> +
> +    uint32_t       imsf_numsrc;    /* Number of sources in
> +                                      the following array */
> +    struct in_addr imsf_slist[1];  /* Array of source
> +                                      addresses */
> +};
> +.fi
> +.in
> +.sp
> +There are two macros,
> +.BR MCAST_INCLUDE
> +and
> +.BR MCAST_EXCLUDE ,
> +which can be used to specify the filtering mode.
> +Additionaly,
> +.BR IP_MSFILTER_SIZE (n)
> +macro exists to determine how much memory is needed to store
> +.I ip_msfilter
> +structure with
> +.I n
> +sources in the source list.
> +.IP
> +For the full description of multicast source filtering
> +refer to RFC 3376.
>  .\"
>  .\" FIXME Document IP_IPSEC_POLICY
>  .\" Since Linux 2.5.47
> @@ -768,6 +872,16 @@ this option be set on the redirected socket.
>  .BR IP_TTL " (since Linux 1.0)"
>  Set or retrieve the current time-to-live field that is used in every packet
>  sent from this socket.
> +.TP
> +.BR IP_UNBLOCK_SOURCE " (since Linux 2.5.68)"
> +Unblock previously blocked multicast source. Returns
> +.BR EADDRNOTAVAIL
> +when given source is not being blocked.
> +.IP
> +Argument is an
> +.I ip_mreq_source
> +structure as described at
> +.BR IP_ADD_SOURCE_MEMBERSHIP .
>  .\" FIXME Document IP_XFRM_POLICY
>  .\" Since Linux 2.5.48
>  .\" Needs CAP_NET_ADMIN
> @@ -1005,6 +1119,7 @@ and
>  .BR socket (7).
>  .SH NOTES
>  .BR IP_FREEBIND ,
> +.BR IP_MSFILTER ,
>  .BR IP_MTU ,
>  .BR IP_MTU_DISCOVER ,
>  .BR IP_RECVORIGDSTADDR ,
> --
> 1.7.10.4
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
