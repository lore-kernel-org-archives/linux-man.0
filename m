From: Johann Baudy <johann.baudy-1YmjpbiIw0bR7s880joybQ@public.gmane.org>
Subject: [PATCH] AF_PACKET and packet mmap
Date: Tue, 23 Jun 2009 21:47:30 +0200
Message-ID: <1245786450.6229.9.camel@bender>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

From: Johann Baudy <johann.baudy-1YmjpbiIw0bR7s880joybQ@public.gmane.org>

Documentation of PACKET_RX_RING and PACKET_TX_RING socket options.

Signed-off-by: Johann Baudy <johann.baudy-1YmjpbiIw0bR7s880joybQ@public.gmane.org>

--

 man7/packet.7 |  212 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 212 insertions(+), 0 deletions(-)

diff --git a/man7/packet.7 b/man7/packet.7
index 0b6c669..ec4973a 100644
--- a/man7/packet.7
+++ b/man7/packet.7
@@ -222,6 +222,218 @@ In addition the traditional ioctls
 .BR SIOCADDMULTI ,
 .B SIOCDELMULTI
 can be used for the same purpose.
+
+Packet sockets can also be used to have a direct access to network device
+through configurable circular buffers mapped in user space.
+They can be used to either send or receive packets.
+
+.B PACKET_TX_RING
+enables and allocates a circular buffer for transmission process.
+
+.B PACKET_RX_RING
+enables and allocates a circular buffer for capture process.
+
+They both expect a
+.B packet_mreq
+structure as argument:
+
+.in +4n
+.nf
+struct tpacket_req {
+    unsigned int    tp_block_size;  /* Minimal size of contiguous block */
+    unsigned int    tp_block_nr;    /* Number of blocks */
+    unsigned int    tp_frame_size;  /* Size of frame */
+    unsigned int    tp_frame_nr;    /* Total number of frames */
+};
+.fi
+.in
+
+This structure establishes a circular buffer of unswappable memory.
+Being mapped in the capture process allows reading the captured frames and
+related meta-information like timestamps without requiring a system call.
+Being mapped in the transmission process allows writing multiple packets that will be sent during
+.BR send (2).
+By using a shared buffer between the kernel and the user space also has
+the benefit of minimizing packet copies.
+
+Frames are grouped in blocks. Each block is a physically contiguous
+region of memory and holds
+.B tp_block_size
+/
+.B tp_frame_size
+frames.
+
+The total number of blocks is
+.B tp_block_nr.
+Note that
+.B tp_frame_nr
+is a redundant parameter because
+
+.in +4n
+frames_per_block = tp_block_size/tp_frame_size
+.in
+
+Indeed, packet_set_ring checks that the following condition is true
+
+.in +4n
+frames_per_block * tp_block_nr == tp_frame_nr
+.in
+
+A frame can be of any size with the only condition it can fit in a block. A block
+can only hold an integer number of frames, or in other words, a frame cannot
+be spawned across two blocks. Please refer to
+.I networking/packet_mmap.txt
+in kernel documentation for more details.
+
+Each frame contains a header followed by data.
+Header is either a
+.B struct tpacket_hdr
+or
+.B struct tpacket2_hdr
+according to socket option
+.B PACKET_VERSION
+(which can be set to
+.B TPACKET_V1
+or 
+.B TPACKET_V2
+respectively through
+.BR setsockopt(2)
+).
+
+With
+.B TPACKET_V1:
+
+.in +4n
+.nf
+struct tpacket_hdr
+{
+    unsigned long	tp_status;
+    unsigned int	tp_len;
+    unsigned int	tp_snaplen;
+    unsigned short	tp_mac;
+    unsigned short	tp_net;
+    unsigned int	tp_sec;
+    unsigned int	tp_usec;
+};
+.fi
+.in
+
+With
+.B TPACKET_V2:
+
+.in +4n
+.nf
+struct tpacket2_hdr
+{
+    __u32 tp_status;
+    __u32 tp_len;
+    __u32 tp_snaplen;
+    __u16 tp_mac;
+    __u16 tp_net;
+    __u32 tp_sec;
+    __u32 tp_nsec;
+    __u16 tp_vlan_tci;
+};
+.fi
+.in
+
+.B tp_len
+is the size of data received from network.
+
+.B tp_snaplen
+is the size of data that follows the header.
+
+.B tp_mac
+is the mac address offset (
+.B PACKET_RX_RING
+only).
+
+.B tp_net
+is the network offset (
+.B PACKET_RX_RING
+only).
+
+.B tp_sec
+,
+.B tp_usec
+is the timestamp of received packet (
+.B PACKET_RX_RING
+only).
+
+.B tp_status
+is the status of current frame.
+
+For
+.B PACKET_TX_RING ,
+status can be
+.B TP_STATUS_AVAILABLE
+if the frame is available for new packet transmission;
+.B TP_STATUS_SEND_REQUEST
+if the frame is filled by user for transmission;
+.B TP_STATUS_SENDING
+if the frame is currently in transmission within the kernel;
+.B TP_STATUS_WRONG_FORMAT
+if the frame format is not properly formatted (This status will only be used if socket option
+.B PACKET_LOSS
+is set to 1).
+
+For
+.B PACKET_RX_RING ,
+a status equal to
+.B TP_STATUS_KERNEL
+indicates that the frame is available for kernel;
+.B TP_STATUS_USER
+indicates that kernel has received a packet (The frame is ready for user);
+.B TP_STATUS_COPY
+indicates that the frame (and associated meta information)
+has been truncated because it's larger than
+.B tp_frame_size
+;
+.B TP_STATUS_LOSING
+indicates there were packet drops from last time
+statistics where checked with
+.BR getsockopt(2)
+and the
+.B PACKET_STATISTICS
+option;
+.B TP_STATUS_CSUMNOTREADY
+is used for outgoing IP packets which it's checksum will be done in hardware.
+
+In order to use this shared memory, the user must call
+.BR mmap (2)
+function on packet socket. Then process depends on socket options:
+
+For
+.B PACKET_TX_RING ,
+the kernel initializes all frames to
+.B TP_STATUS_AVAILABLE.
+To send a packet, the user fills a data buffer of an available frame, sets tp_len to
+current data buffer size and sets its status field to 
+.B TP_STATUS_SEND_REQUEST.
+This can be done on multiple frames. Once the user is ready to transmit, it
+calls
+.BR send (2) .
+Then all buffers with status equal to
+.B TP_STATUS_SEND_REQUEST
+are forwarded to the network device.
+The kernel updates each status of sent frames with
+.B TP_STATUS_SENDING
+until the end of transfer.
+At the end of each transfer, buffer status returns to
+.B TP_STATUS_AVAILABLE.
+
+For
+.B PACKET_RX_RING ,
+the kernel initializes all frames to
+.B TP_STATUS_KERNEL ,
+when the kernel
+receives a packet it puts in the buffer and updates the status with
+at least the
+.B TP_STATUS_USER
+flag. Then the user can read the packet,
+once the packet is read the user must zero the status field, so the kernel
+can use again that frame buffer.
+
 .SS Ioctls
 .B SIOCGSTAMP
 can be used to receive the timestamp of the last received packet.


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
