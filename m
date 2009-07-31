From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] AF_PACKET and packet mmap
Date: Fri, 31 Jul 2009 05:57:53 +0200
Message-ID: <cfd18e0f0907302057q6836abaek80b4fab46e0f8fe5@mail.gmail.com>
References: <1248908658.6777.0.camel@bender>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1248908658.6777.0.camel@bender>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johann Baudy <johann.baudy-1YmjpbiIw0bR7s880joybQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Johann.

On Thu, Jul 30, 2009 at 1:04 AM, Johann Baudy<johann.baudy-1YmjpbiIw0bR7s880joybQ@public.gmane.org>=
 wrote:
> From: Johann Baudy <johann.baudy-1YmjpbiIw0bR7s880joybQ@public.gmane.org>
>
> Documentation of PACKET_RX_RING and PACKET_TX_RING socket options.
>
> Signed-off-by: Johann Baudy <johann.baudy-1YmjpbiIw0bR7s880joybQ@public.gmane.org>

(Please CC me on patches. Otherwise I can easily miss them.)

The patch looks useful. Could you tell me how you got the info? (It
would help me try to verify it.)

Also, what kernel version number did these options appear in?

Thanks,

Michael
> --
>
> =A0man7/packet.7 | =A0212 +++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++
> =A01 files changed, 212 insertions(+), 0 deletions(-)
>
> diff --git a/man7/packet.7 b/man7/packet.7
> index 0b6c669..ec4973a 100644
> --- a/man7/packet.7
> +++ b/man7/packet.7
> @@ -222,6 +222,218 @@ In addition the traditional ioctls
> =A0.BR SIOCADDMULTI ,
> =A0.B SIOCDELMULTI
> =A0can be used for the same purpose.
> +
> +Packet sockets can also be used to have a direct access to network d=
evice
> +through configurable circular buffers mapped in user space.
> +They can be used to either send or receive packets.
> +
> +.B PACKET_TX_RING
> +enables and allocates a circular buffer for transmission process.
> +
> +.B PACKET_RX_RING
> +enables and allocates a circular buffer for capture process.
> +
> +They both expect a
> +.B packet_mreq
> +structure as argument:
> +
> +.in +4n
> +.nf
> +struct tpacket_req {
> + =A0 =A0unsigned int =A0 =A0tp_block_size; =A0/* Minimal size of con=
tiguous block */
> + =A0 =A0unsigned int =A0 =A0tp_block_nr; =A0 =A0/* Number of blocks =
*/
> + =A0 =A0unsigned int =A0 =A0tp_frame_size; =A0/* Size of frame */
> + =A0 =A0unsigned int =A0 =A0tp_frame_nr; =A0 =A0/* Total number of f=
rames */
> +};
> +.fi
> +.in
> +
> +This structure establishes a circular buffer of unswappable memory.
> +Being mapped in the capture process allows reading the captured fram=
es and
> +related meta-information like timestamps without requiring a system =
call.
> +Being mapped in the transmission process allows writing multiple pac=
kets that will be sent during
> +.BR send (2).
> +By using a shared buffer between the kernel and the user space also =
has
> +the benefit of minimizing packet copies.
> +
> +Frames are grouped in blocks. Each block is a physically contiguous
> +region of memory and holds
> +.B tp_block_size
> +/
> +.B tp_frame_size
> +frames.
> +
> +The total number of blocks is
> +.B tp_block_nr.
> +Note that
> +.B tp_frame_nr
> +is a redundant parameter because
> +
> +.in +4n
> +frames_per_block =3D tp_block_size/tp_frame_size
> +.in
> +
> +Indeed, packet_set_ring checks that the following condition is true
> +
> +.in +4n
> +frames_per_block * tp_block_nr =3D=3D tp_frame_nr
> +.in
> +
> +A frame can be of any size with the only condition it can fit in a b=
lock. A block
> +can only hold an integer number of frames, or in other words, a fram=
e cannot
> +be spawned across two blocks. Please refer to
> +.I networking/packet_mmap.txt
> +in kernel documentation for more details.
> +
> +Each frame contains a header followed by data.
> +Header is either a
> +.B struct tpacket_hdr
> +or
> +.B struct tpacket2_hdr
> +according to socket option
> +.B PACKET_VERSION
> +(which can be set to
> +.B TPACKET_V1
> +or
> +.B TPACKET_V2
> +respectively through
> +.BR setsockopt(2)
> +).
> +
> +With
> +.B TPACKET_V1:
> +
> +.in +4n
> +.nf
> +struct tpacket_hdr
> +{
> + =A0 =A0unsigned long =A0 =A0 =A0tp_status;
> + =A0 =A0unsigned int =A0 =A0 =A0 tp_len;
> + =A0 =A0unsigned int =A0 =A0 =A0 tp_snaplen;
> + =A0 =A0unsigned short =A0 =A0 tp_mac;
> + =A0 =A0unsigned short =A0 =A0 tp_net;
> + =A0 =A0unsigned int =A0 =A0 =A0 tp_sec;
> + =A0 =A0unsigned int =A0 =A0 =A0 tp_usec;
> +};
> +.fi
> +.in
> +
> +With
> +.B TPACKET_V2:
> +
> +.in +4n
> +.nf
> +struct tpacket2_hdr
> +{
> + =A0 =A0__u32 tp_status;
> + =A0 =A0__u32 tp_len;
> + =A0 =A0__u32 tp_snaplen;
> + =A0 =A0__u16 tp_mac;
> + =A0 =A0__u16 tp_net;
> + =A0 =A0__u32 tp_sec;
> + =A0 =A0__u32 tp_nsec;
> + =A0 =A0__u16 tp_vlan_tci;
> +};
> +.fi
> +.in
> +
> +.B tp_len
> +is the size of data received from network.
> +
> +.B tp_snaplen
> +is the size of data that follows the header.
> +
> +.B tp_mac
> +is the mac address offset (
> +.B PACKET_RX_RING
> +only).
> +
> +.B tp_net
> +is the network offset (
> +.B PACKET_RX_RING
> +only).
> +
> +.B tp_sec
> +,
> +.B tp_usec
> +is the timestamp of received packet (
> +.B PACKET_RX_RING
> +only).
> +
> +.B tp_status
> +is the status of current frame.
> +
> +For
> +.B PACKET_TX_RING ,
> +status can be
> +.B TP_STATUS_AVAILABLE
> +if the frame is available for new packet transmission;
> +.B TP_STATUS_SEND_REQUEST
> +if the frame is filled by user for transmission;
> +.B TP_STATUS_SENDING
> +if the frame is currently in transmission within the kernel;
> +.B TP_STATUS_WRONG_FORMAT
> +if the frame format is not properly formatted (This status will only=
 be used if socket option
> +.B PACKET_LOSS
> +is set to 1).
> +
> +For
> +.B PACKET_RX_RING ,
> +a status equal to
> +.B TP_STATUS_KERNEL
> +indicates that the frame is available for kernel;
> +.B TP_STATUS_USER
> +indicates that kernel has received a packet (The frame is ready for =
user);
> +.B TP_STATUS_COPY
> +indicates that the frame (and associated meta information)
> +has been truncated because it's larger than
> +.B tp_frame_size
> +;
> +.B TP_STATUS_LOSING
> +indicates there were packet drops from last time
> +statistics where checked with
> +.BR getsockopt(2)
> +and the
> +.B PACKET_STATISTICS
> +option;
> +.B TP_STATUS_CSUMNOTREADY
> +is used for outgoing IP packets which it's checksum will be done in =
hardware.
> +
> +In order to use this shared memory, the user must call
> +.BR mmap (2)
> +function on packet socket. Then process depends on socket options:
> +
> +For
> +.B PACKET_TX_RING ,
> +the kernel initializes all frames to
> +.B TP_STATUS_AVAILABLE.
> +To send a packet, the user fills a data buffer of an available frame=
, sets tp_len to
> +current data buffer size and sets its status field to
> +.B TP_STATUS_SEND_REQUEST.
> +This can be done on multiple frames. Once the user is ready to trans=
mit, it
> +calls
> +.BR send (2) .
> +Then all buffers with status equal to
> +.B TP_STATUS_SEND_REQUEST
> +are forwarded to the network device.
> +The kernel updates each status of sent frames with
> +.B TP_STATUS_SENDING
> +until the end of transfer.
> +At the end of each transfer, buffer status returns to
> +.B TP_STATUS_AVAILABLE.
> +
> +For
> +.B PACKET_RX_RING ,
> +the kernel initializes all frames to
> +.B TP_STATUS_KERNEL ,
> +when the kernel
> +receives a packet it puts in the buffer and updates the status with
> +at least the
> +.B TP_STATUS_USER
> +flag. Then the user can read the packet,
> +once the packet is read the user must zero the status field, so the =
kernel
> +can use again that frame buffer.
> +
> =A0.SS Ioctls
> =A0.B SIOCGSTAMP
> =A0can be used to receive the timestamp of the last received packet.
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
