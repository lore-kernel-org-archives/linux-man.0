From: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] socket.7: Add info about SO_PEEK_OFF option
Date: Mon, 22 Apr 2013 15:43:09 +0400
Message-ID: <5175224D.2070906@parallels.com>
References: <5123CE11.5060900@parallels.com> <CAKgNAkhoStgFnweOABOx3GQnq4Y9NaOambo2UKHcA_7DZiA7SA@mail.gmail.com> <516E5197.3030708@parallels.com> <CAKgNAkiT7sCgB=o0c7BUcPw_dUxQVt4DrsQHKCiRcYrDmUUTvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiT7sCgB=o0c7BUcPw_dUxQVt4DrsQHKCiRcYrDmUUTvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

>> Hope this makes things more clear.
> 
> Yep, that helps considerably. I've extensively reworked your text,
> adding quite a bit more detail. Could you check the text below please?

Yup, this is exactly what I was trying to say! Thanks!

> Cheers,
> 
> Michael
> 
>   SO_PEEK_OFF (since Linux 3.4)
>          This option, which is currently supported only for unix(7)
>          sockets,  sets  the  value  of  the  "peek offset" for the
>          recv(2) system call when used with MSG_PEEK flag.
> 
>          When this option is set to a negative value (it is set  to
>          -1 for all new sockets), traditional behavior is provided:
>          recv(2) with the MSG_PEEK flag will  peek  data  from  the
>          front of the queue.
> 
>          When the option is set to a value greater than or equal to
>          zero, then the next peek at data queued in the socket will
>          occur  at  the  byte offset specified by the option value.
>          At the same time, the "peek offset" will be incremented by
>          the  number  of  bytes that were peeked from the queue, so
>          that a subsequent peek will return the next  data  in  the
>          queue.i
> 
>          If  data is removed from the front of the queue via a call
>          to recv(2) (or similar) without  the  MSG_PEEK  flag,  the
>          "peek  offset"  will  be  decreased by the number of bytes
>          removed.  In  other  words,  receiving  data  without  the
>          MSG_PEEK  flag will cause the "peek offset" to be adjusted
>          to maintain the correct relative position  in  the  queued
>          data,  so  that  a  subsequent peek will retrieve the data
>          that would have been  retrieved  had  the  data  not  been
>          removed.
> 
>          For  datagram  sockets, if the "peek offset" points to the
>          middle of a packet, the data returned will be marked  with
>          the MSG_TRUNC flag.
> 
>          The  following  example  serves  to  illustrate the use of
>          SO_PEEK_OFF.  Suppose a stream socket  has  the  following
>          queued input data:
> 
>              aabbccddeeff
> 
>          The  following  sequence  of  recv(2) calls would have the
>          effect noted in the comments:
> 
>              int ov = 4;                  // Set peek offset to 4
>              setsockopt(fd, SOL_SOCKET, SO_PEEK_OFF, &ov, sizeof(ov));
> 
>              recv(fd, buf, 2, MSG_PEEK);  // Peeks "cc"; offset set to 6
>              recv(fd, buf, 2, MSG_PEEK);  // Peeks "dd"; offset set to 8
>              recv(fd, buf, 2, 0);         // Reads "aa"; offset set to 6
>              recv(fd, buf, 2, MSG_PEEK);  // Peeks "ee"; offset set to 8
> .
> 


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
