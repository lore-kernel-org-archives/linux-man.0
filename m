From: Petr Malat <oss-uyNjkDRvLzClVyrhU4qvOw@public.gmane.org>
Subject: Incorrect behaviour or documentation problem of SO_RXQ_OVFL
Date: Wed, 15 Nov 2017 16:14:15 +0100
Message-ID: <20171115151415.GA22906@bordel.klfree.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!
Generic SO_RXQ_OVFL helpers sock_skb_set_dropcount() and sock_recv_drops()
implements returning of sk->sk_drops (the total number of dropped packets),
although the documentation says the number of dropped packets since the 
last received one should be returned (quoting the current socket.7):
  SO_RXQ_OVFL (since Linux 2.6.33)
  Indicates that an unsigned 32-bit value ancillary message (cmsg)
  should be attached to received skbs indicating the number of packets
  dropped by the socket between the last received packet and this
  received packet.

I assume the documentation needs to be updated, as fixing this in the
code could break programs depending on the current behavior, although
the formerly planned functionality seems to be more usefull.

The problem can be revealed with the following program:

#include <netinet/in.h>
#include <netinet/ip.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>

int extract_drop(struct msghdr *msg)
{
        struct cmsghdr *cmsg;
        int rtn;

        for (cmsg = CMSG_FIRSTHDR(msg); cmsg; cmsg = CMSG_NXTHDR(msg,cmsg)) {
                if (cmsg->cmsg_level == SOL_SOCKET &&
                    cmsg->cmsg_type == SO_RXQ_OVFL) {
                        memcpy(&rtn, CMSG_DATA(cmsg), sizeof rtn);
                        return rtn;
                }
        }
        return -1;
}

int main(int argc, char *argv[])
{
        struct sockaddr_in addr = { .sin_family = AF_INET };
        char msg[48*1024], cmsgbuf[256];
        struct iovec iov = { .iov_base = msg, .iov_len = sizeof msg };
        int sk1, sk2, i, one = 1;

        sk1 = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
        sk2 = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);

        inet_pton(AF_INET, "127.0.0.1", &addr.sin_addr);
        addr.sin_port = htons(53333);

        bind(sk1, (struct sockaddr*)&addr, sizeof addr);
        connect(sk2, (struct sockaddr*)&addr, sizeof addr);

        // Kernel doubles this limit, but it accounts also the SKB overhead,
        // but it receives as long as there is at least 1 byte free.
        i = sizeof msg;
        setsockopt(sk1, SOL_SOCKET, SO_RCVBUF, &i, sizeof i);
        setsockopt(sk1, SOL_SOCKET, SO_RXQ_OVFL, &one, sizeof one);

        for (i = 0; i < 4; i++) {
                int rtn;

                send(sk2, msg, sizeof msg, 0);
                send(sk2, msg, sizeof msg, 0);
                send(sk2, msg, sizeof msg, 0);

                do {
                        struct msghdr msghdr = {
                                        .msg_iov = &iov, .msg_iovlen = 1,
                                        .msg_control = &cmsgbuf,
                                        .msg_controllen = sizeof cmsgbuf };
                        rtn = recvmsg(sk1, &msghdr, MSG_DONTWAIT);
                        if (rtn > 0) {
                                printf("rtn: %d drop %d\n", rtn,
                                                extract_drop(&msghdr));
                        } else {
                                printf("rtn: %d\n", rtn);
                        }
                } while (rtn > 0);
        }

        return 0;
}

which prints
  rtn: 49152 drop -1
  rtn: 49152 drop -1
  rtn: -1
  rtn: 49152 drop 1
  rtn: 49152 drop 1
  rtn: -1
  rtn: 49152 drop 2
  rtn: 49152 drop 2
  rtn: -1
  rtn: 49152 drop 3
  rtn: 49152 drop 3
  rtn: -1
although it should print (according to the documentation):
  rtn: 49152 drop 0
  rtn: 49152 drop 0
  rtn: -1
  rtn: 49152 drop 1
  rtn: 49152 drop 0
  rtn: -1
  rtn: 49152 drop 1
  rtn: 49152 drop 0
  rtn: -1
  rtn: 49152 drop 1
  rtn: 49152 drop 0
  rtn: -1

Please keep me on To:/CC: as I'm not on the list.
Cheers,
  Petr
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
