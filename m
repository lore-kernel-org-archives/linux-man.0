From: Stephen Hemminger <shemminger-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: TCP_CONGESTION documentation
Date: Fri, 21 Nov 2008 23:39:18 -0800
Message-ID: <20081121233918.7ade5fcb@extreme>
References: <4926DC7B.7020203@gmail.com>
	<cfd18e0f0811210808u349aad61y2ae8a1590904a821@mail.gmail.com>
	<20081121204210.GG6703@one.firstfloor.org>
	<cfd18e0f0811211244v5d391f8du3380332a721ed33@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811211244v5d391f8du3380332a721ed33-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-net-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Does this help get it started in right direction??
--------------------------------------------

       This  is an implementation of the TCP protocol defined in
       RFC 793, RFC 1122 and RFC 2001 with the NewReno and  SACK
       extensions.   It  provides  a  reliable, stream-oriented,
       full-duplex connection between  two  sockets  on  top  of
       ip(7),  for both v4 and v6 versions.  TCP guarantees that
       the data arrives in order and retransmits  lost  packets.
       It  generates  and  checks a per-packet checksum to catch
       transmission errors.  TCP does not preserve record bound-
       aries.

       A newly created TCP socket has no remote or local address
       and is not fully specified.  To create  an  outgoing  TCP
       connection  use  connect(2)  to establish a connection to
       another TCP socket.  To receive new incoming connections,
       first  bind(2) the socket to a local address and port and
       then call listen(2) to put the socket into the  listening
       state.  After that a new socket for each incoming connec-
       tion can be accepted using accept(2).  A socket which has
       had  accept(2) or connect(2) successfully called on it is
       fully specified and may transmit data.   Data  cannot  be
       transmitted on listening or not yet connected sockets.

[move buffering ahead of 1323 stuff - more important]

Socket buffers on linux are automatically tuned by Linux
TCP based on available memory and the throughput of the
socket. The starting value and upper bound of buffer tuning
is determined by tcp_rwin (for receiving) and tcp_wwin (for sending)
as described in Sysctls secton. The buffer sizes can be
fixed with SO_SNDBUF and SO_RCVBUF mechanisms.

       Note that  TCP  actually  allocates twice the size of the
       buffer requested in
       the setsockopt(2) call, and so a succeeding getsockopt(2)
       call will not return the same size of buffer as requested
       in the setsockopt(2) call.  TCP uses the extra space  for
       administrative  purposes  and internal kernel structures,
       and the /proc file values reflect the larger  sizes  com-
       pared  to  the actual TCP windows.  
       The  maximum  sizes  for  socket buffers declared via the
       SO_SNDBUF and SO_RCVBUF mechanisms  are  limited  by  the
       values in  the net.core.rmem_max and net.core.wmem_max
       sysctl values.

       On individual connec-
       tions, the socket buffer size must be set  prior  to  the
       listen(2)  or  connect(2)  calls in order to have it take
       effect.  See socket(7) for more information.
      
       Linux  supports RFC 1323 TCP high performance extensions.
       These include Protection Against Wrapped Sequence Numbers
       (PAWS),  Window  Scaling  and Timestamps.  Window scaling
       allows the use of large (> 64K) TCP windows in  order  to
       support  links  with  high latency or bandwidth. 

       TCP supports urgent data.  Urgent data is used to  signal
       the  receiver  that some important message is part of the
       data stream and that it should be processed  as  soon  as
       possible.  To send urgent data specify the MSG_OOB option
       to send(2).  When urgent data  is  received,  the  kernel
       sends  a  SIGURG  signal  to the process or process group
       that has been set as the socket "owner" using the SIOCSP-
       GRP  or  FIOSETOWN  ioctls (or the POSIX.1-2001-specified
       fcntl(2)  F_SETOWN  operation).   When  the  SO_OOBINLINE
       socket  option  is  enabled,  urgent data is put into the
       normal data stream (a program can test for  its  location
       using the SIOCATMARK ioctl described below), otherwise it
       can be only received when the MSG_OOB  flag  is  set  for
       recv(2) or recvmsg(2).

Linux supports multiple different congestion control
algorithms. The default choice of congestion control is controlled
by net.ipv4.tcp_congestion_control sysctl. This value can
be overridden by TCP_CONGESTION socket option. The actual choices
of congestion control available vary according between release
as more are added, and depend on the configuration choices
made when the kernel was built. The list of congestion control
protocols currently loaded is in net.ipv4.tcp_available_congestion_control.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
