From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: packet(7) omits sll_protocol from required field list for outbound
 packets
Date: Wed, 06 May 2015 15:06:02 +0200
Message-ID: <554A11BA.4060101@gmail.com>
References: <4FCFCB49.20504@riscpkg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FCFCB49.20504-1YjpMCWsJptAfugRpC6u6w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Graham Shaw <gdshaw-1YjpMCWsJptAfugRpC6u6w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Graham,

On 06/06/2012 11:27 PM, Graham Shaw wrote:
> The manpage packet(7) currently states that:
> 
> "When you send packets it is enough to specify sll_family, sll_addr, 
> sll_halen, sll_ifindex."
> 
> This is incorrect: you also need to specify sll_protocol.
> 
> (The protocol specified when the socket is created is used for filtering 
> inbound packets, but not for constructing outbound packets.)
> 
> I encountered this while researching a page for my website:
> 
> http://www.microhowto.info/howto/send_an_arbitrary_ethernet_frame_using_an_af_packet_socket_in_c.html
> 
> To empirically verify the behaviour I took my test code from the above 
> page then changed it to use different values for the third argument to 
> socket() and the sll_protocol field:
> 
> - socket created with ETH_P_ARP, packet sent with ETH_P_ARP:
>      packet sent with EtherType of ETH_P_ARP
> - socket created with ETH_P_ARP, sll_protocol==0:
>      packet sent with EtherType of 0
> - socket created with 0x88b5, sll_protocol==htons(ETH_P_ARP):
>      packet sent with EtherType of ETH_P_ARP
> - socket created with ETH_P_ARP, sll_protocol==htons(0x88b5):
>      packet sent with EtherType of 0x88b5
> 
> This shows that leaving sll_protocol set to zero does not have the 
> desired effect and that it needs to be set to the desired link-layer 
> protocol.
> 
> There is code in the relevant kernel source file 
> (net/packet/af_packet.c) which appears to inspect the value of the 
> sll_protocol field and use it as the link-layer protocol number, however 
> I am not sufficiently familiar with this subsystem to be fully confident 
> of what is happening. The line in question is:
> 
>      proto   = saddr->sll_protocol;
> 
> In version 3.4 of the kernel this can be found in the functions 
> packet_snd and tpacket_snd. In version 2.6.26 it is in packet_sendmsg.
> 
> Below is a patch that adds sll_protocol to the list of required fields. 
> This may not be the whole truth, since it is not clear what role if any 
> sll_protocol, sll_halen or sll_addr would play when the socket type is 
> SOCK_RAW, however I'm confident it is more accurate than the page as it 
> stands at present:
> 
> diff --git a/man7/packet.7 b/man7/packet.7
> index 374f6da..fb09f15 100644
> --- a/man7/packet.7
> +++ b/man7/packet.7
> @@ -160,7 +160,9 @@ When you send packets it is enough to specify
>   .IR sll_family ,
>   .IR sll_addr ,
>   .IR sll_halen ,
> -.IR sll_ifindex .
> +.IR sll_ifindex
> +and
> +.IR sll_protocol .
>   The other fields should be 0.
>   .I sll_hatype
>   and

Sorry for the very long delay in dealing with this patch.
My light reading of the kernel source suggests your analysis 
is correct, and I've applied the patch.

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
