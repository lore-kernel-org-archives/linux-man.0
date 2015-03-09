From: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Subject: Handling of updates to kernel Documentation/ tree
Date: Mon, 09 Mar 2015 15:17:58 +0100
Message-ID: <3421611.4D45Q2BAys@tauon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <michael.kerrisk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

how shall an update to the Documentation/ tree be handled in man pages 
that contain a pointer to these documents?

Specifically, socket(2) contains a reference to 
Documentation/crypto/crypto-API-userspace.txt. With the patch [1] the 
document is gone and its contents is moved into a DocBook.

Shall the kernel DocBook website [2] be referenced? If so, when is it 
appropriate to add the patch (note, the change is expected to be 
propagated to Linus' tree in 4.1-rc1).


[1] 
https://git.kernel.org/cgit/linux/kernel/git/herbert/cryptodev-2.6.git/commit/?id=dbe5fe7e1b3b3632bef2c09964a5f5505de4d744

[2] https://www.kernel.org/doc/htmldocs/crypto-API/index.html

Ciao
Stephan

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
