From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Incorrect behaviour or documentation problem of SO_RXQ_OVFL
Date: Mon, 20 Nov 2017 12:34:04 +0100
Message-ID: <CAKgNAkif7LAhJXif7DvzNJctAJKOTBO-BU5F-5ND+S3GOsRWmg@mail.gmail.com>
References: <20171115151415.GA22906@bordel.klfree.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171115151415.GA22906-D9B+/Xy6VmVJc+xitdX5216hYfS7NtTn@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Malat <oss-uyNjkDRvLzClVyrhU4qvOw@public.gmane.org>
Cc: netdev <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tobias Klausmann <klausman-MzPq5hiN5PY4ErOGf3VzIA@public.gmane.org>, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[Adding Neil, who wrote the original text. Maybe he has also some
suggested improvement.]

Hello Petr and Tobias,

Thank you both for your reports about the incorrect documentation. See below.

On 15 November 2017 at 16:14, Petr Malat <oss-uyNjkDRvLzClVyrhU4qvOw@public.gmane.org> wrote:
> Hi!
> Generic SO_RXQ_OVFL helpers sock_skb_set_dropcount() and sock_recv_drops()
> implements returning of sk->sk_drops (the total number of dropped packets),
> although the documentation says the number of dropped packets since the
> last received one should be returned (quoting the current socket.7):
>   SO_RXQ_OVFL (since Linux 2.6.33)
>   Indicates that an unsigned 32-bit value ancillary message (cmsg)
>   should be attached to received skbs indicating the number of packets
>   dropped by the socket between the last received packet and this
>   received packet.
>
> I assume the documentation needs to be updated, as fixing this in the
> code could break programs depending on the current behavior, although
> the formerly planned functionality seems to be more usefull.
>
> The problem can be revealed with the following program:
>
> #include <netinet/in.h>
> #include <netinet/ip.h>
> #include <sys/socket.h>
> #include <arpa/inet.h>
> #include <sys/types.h>
> #include <unistd.h>
> #include <string.h>
> #include <stdio.h>
>
> int extract_drop(struct msghdr *msg)
> {
>         struct cmsghdr *cmsg;
>         int rtn;
>
>         for (cmsg = CMSG_FIRSTHDR(msg); cmsg; cmsg = CMSG_NXTHDR(msg,cmsg)) {
>                 if (cmsg->cmsg_level == SOL_SOCKET &&
>                     cmsg->cmsg_type == SO_RXQ_OVFL) {
>                         memcpy(&rtn, CMSG_DATA(cmsg), sizeof rtn);
>                         return rtn;
>                 }
>         }
>         return -1;
> }
>
> int main(int argc, char *argv[])
> {
>         struct sockaddr_in addr = { .sin_family = AF_INET };
>         char msg[48*1024], cmsgbuf[256];
>         struct iovec iov = { .iov_base = msg, .iov_len = sizeof msg };
>         int sk1, sk2, i, one = 1;
>
>         sk1 = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
>         sk2 = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
>
>         inet_pton(AF_INET, "127.0.0.1", &addr.sin_addr);
>         addr.sin_port = htons(53333);
>
>         bind(sk1, (struct sockaddr*)&addr, sizeof addr);
>         connect(sk2, (struct sockaddr*)&addr, sizeof addr);
>
>         // Kernel doubles this limit, but it accounts also the SKB overhead,
>         // but it receives as long as there is at least 1 byte free.
>         i = sizeof msg;
>         setsockopt(sk1, SOL_SOCKET, SO_RCVBUF, &i, sizeof i);
>         setsockopt(sk1, SOL_SOCKET, SO_RXQ_OVFL, &one, sizeof one);
>
>         for (i = 0; i < 4; i++) {
>                 int rtn;
>
>                 send(sk2, msg, sizeof msg, 0);
>                 send(sk2, msg, sizeof msg, 0);
>                 send(sk2, msg, sizeof msg, 0);
>
>                 do {
>                         struct msghdr msghdr = {
>                                         .msg_iov = &iov, .msg_iovlen = 1,
>                                         .msg_control = &cmsgbuf,
>                                         .msg_controllen = sizeof cmsgbuf };
>                         rtn = recvmsg(sk1, &msghdr, MSG_DONTWAIT);
>                         if (rtn > 0) {
>                                 printf("rtn: %d drop %d\n", rtn,
>                                                 extract_drop(&msghdr));
>                         } else {
>                                 printf("rtn: %d\n", rtn);
>                         }
>                 } while (rtn > 0);
>         }
>
>         return 0;
> }
>
> which prints
>   rtn: 49152 drop -1
>   rtn: 49152 drop -1
>   rtn: -1
>   rtn: 49152 drop 1
>   rtn: 49152 drop 1
>   rtn: -1
>   rtn: 49152 drop 2
>   rtn: 49152 drop 2
>   rtn: -1
>   rtn: 49152 drop 3
>   rtn: 49152 drop 3
>   rtn: -1
> although it should print (according to the documentation):
>   rtn: 49152 drop 0
>   rtn: 49152 drop 0
>   rtn: -1
>   rtn: 49152 drop 1
>   rtn: 49152 drop 0
>   rtn: -1
>   rtn: 49152 drop 1
>   rtn: 49152 drop 0
>   rtn: -1
>   rtn: 49152 drop 1
>   rtn: 49152 drop 0
>   rtn: -1
>
> Please keep me on To:/CC: as I'm not on the list.

Thanks for the test program. Tobias reported the same issue, and I've
applied his suggested change to the page. (See below.)

Cheers,

Michael

diff --git a/man7/socket.7 b/man7/socket.7
index 79966a6fd..1a2cfe9cc 100644
--- a/man7/socket.7
+++ b/man7/socket.7
@@ -881,8 +881,7 @@ compete to receive datagrams on the same socket.
 .\" commit 3b885787ea4112eaa80945999ea0901bf742707f
 Indicates that an unsigned 32-bit value ancillary message (cmsg)
 should be attached to received skbs indicating
-the number of packets dropped by the socket between
-the last received packet and this received packet.
+the number of packets dropped by the socket since its creation.
 .TP
 .B SO_SNDBUF
 Sets or gets the maximum socket send buffer in bytes.


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
