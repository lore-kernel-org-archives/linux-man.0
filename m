Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC7C3DB319
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345054; cv=none; b=HPeC/hdvJ+0zu4ECy1UHYoH5Tb5iLkA3w0urCdeMsMggVWTt3fnth693OJirf1jdWXW13DEjNOPQ735Tdzk4pOtqiXKZaZ7MWqp0oCsWSA4fY2NtAtFf2QBCPPjhyGTGZlCcljUqfmuSn1hcO9+ixRX4wCScmQ7NbqRD/1jVCEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345054; c=relaxed/simple;
	bh=/c8+VaahQ++ckBCYC0JRe03VJmwGqfJkLPDV8gevDk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W+jKSfk/JoJA3u1UumsHUJYZAYU2m3RnhCnBGuyxCpUTf+gTgR+/Mb+Zd7SqB/e6MorLiwC30M/DRwEipKeQjrunbxAVVgCoW70mqBUM5bzdCAkavhZsujcoCWP+S7UxVX12Cq8uwNnHWrVYpxwwC4K2tBef6XHYt8SgUFU+a/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXnwcMTD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXnwcMTD"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48bbb06e746so576202f8f.3
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345052; x=1792949852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x+Q0SiwUG9p6joQf5bDlwDBFJX2Tr3l/Y9OnJz8CAQM=;
        b=SXnwcMTDC9HoHTf8aihti6OTzh0kM5AabXCZdM1T+eUf7HZIUWm5zrvksMX0Salpm9
         qMjQrAsYCWvzRkssF89efZjvfpiNb73e4uk5jDYjYznHjohw5jgc6nl0PGAf0OIqwHE4
         zlWKH8unCQNSY0CxLRhYx2WbAkarKmUqmTo1CAzNMY0E41Ht3ZNhC/rgLf0tBZl5Yt2L
         m0O+RkjZ0VYywS+p8dBXvmj0qcWJdg4p6KoFvatk7ZkRQ2x5IJVLKOSujg7wHjaMzkjA
         eF5gMIkY0nRCmC0c21jBhc4QNTkUeNUluis8BVU+8WaqA/ptMJ7NDiSJjz7C1KW/OTON
         Mo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345052; x=1792949852;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+Q0SiwUG9p6joQf5bDlwDBFJX2Tr3l/Y9OnJz8CAQM=;
        b=lQygjZPSi541dbNAANq37ZheKv3AyAzg572Wf4WpNZ8bZKoQI+HeQRj/qvMnDlUYjz
         ujthva0gxmisTr25POCCa/600TUyK3nagvjeENh5vlsxb0QKyIZ0C1TbV4m25+jzm7Az
         i5j62ZChnec1GwqP/ARgTCCCPcnNqaCrnMLU1RHze3wjiDJ9FflvCfSBPwyalsqeMc7W
         01kHFzUABQ6GnXbWqbow3IRexK40rAUkGjGXwd4+8dFNf5Ios88m0UOP8u0YO1AgaTxr
         T8P88P8rXXcaEgygFAckqh44BD7xmMQtDnOJNFyFMWTovzcLbgM070sYk3Mdnpa0wpkw
         gxFA==
X-Gm-Message-State: AFq9FYI9Re6APDaqiVUBdVOV7vgcZl2VmkH4xsYrPu9HQfzMlX528JpC
	wu4lXo/FV9UoTRmbOa8ZvWd9Kh0BPDc2COPnzDWkaB6K1KOvL3iRj/OmpxyhyMCT
X-Gm-Gg: AYBFou3yxubQ+IvA2DQcW7/xhKeY8YxzE44ewfGElxIMV2y/tej1xea8kJUmfOXNvyD
	U1wjrlyt280i8NuAjLPcCeIxhdvpawpagVPw14J/mFYRAnOXBXzGZjK40vJi7/GEDqkRs77Vhze
	YoN2+SeGWeWRJmJmUKvmfxxxMHUFYFD/7c1eJS5TfIwC1Af5Lpha8GEiH9rzc9g26pMO/9EKt5X
	CRiXiGZZsVE5WMG2vRM/BbUTAxiPXQva5PFs93htTd5Kvh3FmsnY4H57hc2Lz6O6d2VJ+MOBPFM
	eZhj1x0ArcpM6d3hhfpbAG39l1aLCYy/gQFTYan2eqlQEIA9mVDh4scktvkc4gjbD/npBAG0lBD
	3ewJyH6ET6ClujjB/KnEj0RvPeGZQ6sC++aah8JSB+g5TO+ztBpKx+hSOjDnRDPE8Y9B3cmDaZv
	dWF04KrJic7c7b2omJ02D/qo4QBOvxE/TpOQibnWChWl3QkaXlFW1sKpdbTiVzaPuwF5LIiN+w6
	YxJtpFP8ZfsWXfQbcqwfBY=
X-Received: by 2002:a05:6000:3108:b0:486:f907:ebec with SMTP id ffacd0b85a97d-48e07bc104dmr12726737f8f.31.1792345051733;
        Sun, 18 Oct 2026 10:37:31 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471b06sm20004512f8f.5.2026.10.18.10.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:31 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH v2 09/24] man/man7/unix.7: SO_PEERCRED: Also works for SOCK_SEQPACKET
Date: Sun, 18 Oct 2026 19:36:57 +0200
Message-ID: <20261018173712.27670-10-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018173712.27670-1-gnoack3000@gmail.com>
References: <20261018173712.27670-1-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SOCK_SEQPACKET sockets use unix_stream_connect() as their connect
operation (see unix_seqpacket_ops in linux.git net/unix/af_unix.c), and
that function records the peer credentials for both ends.
unix_socketpair() records them for socket pairs of every type.

Connected SOCK_DGRAM sockets (unix_dgram_connect()) still don't record
peer credentials, so those remain excluded.

Fixes: 73b3a5686084 (2005-08-16; "Clarified details of use of SO_PEERCRED.")
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Double checked in code.
    
    The unix(7) SOCK_SEQPACKET socket type is also connection-oriented and
    shares the "connect" logic with SOCK_STREAM sockets.

 man/man7/unix.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 86e72d0f58d4..8fd29131ce48 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -342,9 +342,9 @@ feature test macro to obtain the definition of that structure from
 .IP
 The use of this option is possible only for connected
 .B AF_UNIX
-stream sockets and for
+stream and sequenced-packet sockets, and for
 .B AF_UNIX
-stream and datagram socket pairs created using
+socket pairs created using
 .BR socketpair (2).
 .\"
 .SS Autobind feature
-- 
2.56.0

