Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737359;
	b=zYcLconCkptQ7KBCpbooUG/t0vvy8mAbI5jg8qcFHEH8EgnuTD9Dnl0w7cYaY1PeBFdm
	 0hrbGT+1uQ7ucH45A+6PEig40kTP/ifoj3wJgc2NELj1wlia1l2+SnSrH8JQEZ1gethBO
	 FBo4QOQ9N1ibl1ZjJrgx/2stXQAdgOQxco0DY30RbyA7oT6tViqY8N+1zAVP8Vz01FrvD
	 DEiz288aHhn1LlKxi7HOLXzWgccuA2bs6Ec85WONwYQGWcjOOhcG/iT2zo0MEs1EUtVKU
	 uIbdqCoMjTz+s64KSBPm5wir0H8sHTSJcm2U1U7HfYl7q9zKE6I26FnC8AvRvFiShQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jH3wayl3EKIWPihL2PcpZefKaCfj5sElu04QmqWXiRU=;
	b=A03C+At4D8ZPXUUxKzO/2dZxr7jHxzLks3eEFWLw6gyusXcAJAqcPZwl2hs8tGMBT/QP
	 BK0wZBAIekfjjlkk+2YtrR+jsWGjMVLV/H3vYYvmGQXXcwNORi2TNis1M8Cqe1dXcFcni
	 aSKCobleVunA03jgYbqL5/1cAtIUPb9cpbTxWsTKlv+2KPPVdmuQf1rpvysP3VeT+ZpR3
	 39lGmMUuk9rkShlPvptHc4gdYF1dgE3RBrIlj9ilu9YDykC/LEsMwvOVXhnTar8jvxf2L
	 5rD7zVs4wMjHreHwTiAcz2Fif81n628UA8vlZuEJpw3nieF13KpWjg+j7hB0S42XnCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jAB7D0xp;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D346606A31B
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D346606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jAB7D0xp
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so47604515e9.3
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737357; x=1794342157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jH3wayl3EKIWPihL2PcpZefKaCfj5sElu04QmqWXiRU=;
        b=jAB7D0xpj7ofzUTmoEwJIUfN1S5LryHNWEE4TS5sBLU61W1cxRdz6TSSNDWvZ3dmEH
         WU+nhQCqB9+jUQg14jXyycMNQGmLyqMihog17vzS3ofMj5aY9BbG1Lo0zJqlpHsKjF7P
         c71+vq2TBzArWPyZPmSEa3wMMSsnwuSn45ll/u9T90PRfN+Au+Ouxb92CnK4ievjtB/D
         CiUXNpxOZJkWZfiUe84UuL03JsQ0yojlOYyu2rwagFD1DpxfVJ/lGDlEIFipt2jRWfNI
         1FLnku8MSK0W9lEwSLYCLKPtkiuN3huqytWmKGb4Rdr1DspLDFXf4lepeUNaW7Um4T06
         PTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737357; x=1794342157;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jH3wayl3EKIWPihL2PcpZefKaCfj5sElu04QmqWXiRU=;
        b=mUTt0Yj3tYJH4EdNrQeiWAGaQAwhnZFj6+T91ZTcZGHp3sajymfOF4UYVXZcc625Ng
         XJuv6XlEwSYCjYj9+G5EH9a0Up3ZLg7F7nJIrLal+9++RBMq3T1yFyuT0l+aPCg2Cu1X
         7nYpeyCZAi+xalVl7vQ4liFCvUjaMrCG1wKRrPaAL4KElS+KMl4FAvJ8//CyEJmARHRo
         075ylyQu6auprYAXfjvFand5EdJxmwTBXhKv28RbC1SRj8I6XdOZBdWbmkBWZcY9E9p8
         sHQV9RLO1++NpQOnfmF9DiiWF15zlh1qsaemRw7dzOeSc/Pl8TTlyeNmI1fywxXFTynw
         ECXA==
X-Forwarded-Encrypted: i=1; AKwUvBytQ38RsDYriaY1FH2IkV4SooHnQP4B/wtd8cwyvIPicbOavP2CAd2i+Vy+DnrFZ5orbLXC8GliC8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OC+1/IabVBUxyDWGyRmNd7ySW/8U2UvKviJ8WgA+HSEX4pept
	F2Q3WuTerMoaNsxYC7/DEbhbUqc2RxiascuOhTV95D4FdraDYxhxl1hx
X-Gm-Gg: AYBFou2mcyZAve/UnTxCbRbb8Byh74TDF6r96dZkxwPIYZkda/VUJnrg6eIOKyX9HCE
	tFvB621C3TTzhAxUjvV0RQZTeC0C0BxRXtAO9XqtqwnYwxnylib51XJ0cDJ4/Tpc5wXAPz1NQ+P
	d07aOCqdZnuT9TuVundmbPoE9qYs4LpoOXC8cSGSenE93W9T3rJEEoEn1+lGK7SE3WVT/qPIBIM
	P6jcWQh60DqDR3tBg82MOITuwuo6X7HRmLbY8nGyxoWgnncwsI0e+HHkyd/G9D/gCLy5gYtHsUh
	ik6m+QxQSt+apJSA/xRIrAkoB5gA8vUVIgBOrKzXMNiKgvunrL9jF5pPWMYjC29Qv9LNlSgEL3s
	AqNIQk+mXps/UHDRS8hntey9D0MkH1iLemUi0ipl/yniqJ/ILfbksD2zzdp63YJ66sDC+uaB7OL
	VXY5lQNMjgcXT5CKaSIncKvC7nAQXIY3ekKQ5Qz0BsxnMSdzTjzuchUvI99E/PG3HXY1zD4CGl4
	mrNScRbWLnned1AifSaKBQfL/c3h2/VrEPQohovSdAFbcL6mLODJkZml0XBaDC7hABGwU+Ns1h7
	BwpW1Db/JjmvXTrgPUeSku0EhKQW6cINX677bzFtMf5uZxsuC+PlSA==
X-Received: by 2002:a05:600c:348d:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4ac19234acbmr308481005e9.33.1793737356848;
        Tue, 03 Nov 2026 12:22:36 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa38bb4asm84862745e9.6.2026.11.03.12.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:22:36 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH v2 2/8] man/man7/unix.7: Multiple same-typed SCM_* messages may be sent in one message
Date: Tue,  3 Nov 2026 21:22:04 +0100
Message-ID: <20261103202211.13820-3-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103202211.13820-1-gnoack3000@gmail.com>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In the Linux kernel code, __scm_send() in linux.git net/core/scm.c
walks all control messages in a loop like this:

	for_each_cmsghdr(cmsg, msg) {
		// ...
		switch (cmsg->cmsg_type)
		{
		case SCM_RIGHTS:
			... append(!) file descriptors
			    up to the SCM_MAX_FD limit ...
			break;
		case SCM_CREDENTIALS:
			... replace previously set credentials ...
			break;
		default:
			goto error;
		}
	}

So it is possible to pass multiple SCM_* messages -- they will compose
if possible and override the previous value if not.  Since their
contents are being conflated that way, they will appear as one message
again on the receiving side.

Keep the recommendation as portability advice, and describe the Linux
behavior.

Fixes: 5b5cb1958062 (2018-07-10; "unix.7: When sending ancillary data, only one item of each type may be sent")
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    The factual analysis in the commit message is correct.
    
    I kept the LLM phrasing; it did not seem overly wordy to me and the
    style is in line with the paragraph after it, which also documents
    Linux-only vs. portable APIs that way.

 man/man7/unix.7 | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 94b9e82af3c0..1695f1c120c7 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -538,7 +538,24 @@ .SS Ancillary messages
 .P
 When sending ancillary data with
 .BR sendmsg (2),
-only one item of each of the above types may be included in the sent message.
+portable applications should include
+only one item of each of the above types in the sent message.
+On Linux,
+if several
+.B SCM_RIGHTS
+items are included,
+their file descriptors are combined into a single list,
+to which the
+.B SCM_MAX_FD
+limit applies as a whole,
+and the receiver gets them in a single
+.B SCM_RIGHTS
+item;
+if several
+.B SCM_CREDENTIALS
+items are included,
+each of them is checked,
+and the last one is sent.
 .P
 At least one byte of real data should be sent when sending ancillary data.
 On Linux, this is required to successfully send ancillary data over
-- 
2.56.0

