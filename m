Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874676;
	b=KmA+/WVvgxqaggoM8KQqfdN+t7Yv8iNSbNATuTEGXnv0vKhgk8tERc0yKdYoeDCJS4bd
	 /BZ9LLGZsFwBY2HdfBFWVPc1zcuJlAkRbNN23A8mWhxIPFUtlMZgzPA4MDAIL9aKBd+n1
	 VaTe1cMUK3376LOlW942I/4QUd0CYKBHr+oBjcmgukipLYSu+YGWeIe1OLm7tLSk3q2RY
	 InVDro3+wu78s9nYWB7n9kzV1sseJ15WCtit1H0mWeHvx4gxCIHuNaHMqmqO4oa9aCQxc
	 g8iG1/2uYY39d8e5hUYTjnyHWGIeZdSexdthrDatr9jS6ey0JBIEvrSkF4GTid+ZSuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=g1CqHinjbY2OgjrRQj70R8H/Be4OoPMLQb2dQpJZInM=;
	b=EG1qJaE8BR5cBLwgaSYPgZ7CYh6X8KpBkHzjlj5vBi1kL+69uZ37qdkwMwSNlI1NyCsB
	 lv+rX+zH4vNBq4iAMsv20NovzdcD3Ml9YxWUml6zLltkTvOqTuDeXfGKwb274U/JHElv0
	 SVgwzjdqLFQuFRB0EtDt+clprwFlEMp10z7VOgAO6g8hgqHVqYFTu2DuQ4WNlEYGWhcyi
	 R2PCbEkrDXOSZZW1be/dHBP9Nx+7q5z3li07e4G5jL8otDhBIuBa1aLP5j6/b475BTwiL
	 ADDii1a5095PD+2WYRH49INkA5pUuIfeBSgiuIABkiw5Irh9UwJsg2GGwNF0jov/DPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wiup1+eY;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA81606A885
	for <linux-man@vger.kernel.org>; Tue, 17 Nov 2026 00:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA81606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wiup1+eY
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so317828241.0
        for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 16:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794874671; x=1795479471; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1CqHinjbY2OgjrRQj70R8H/Be4OoPMLQb2dQpJZInM=;
        b=wiup1+eYOz2l3MPJFqbC2wWZVp7n9BZT7aJO+IKN0DSmQLsuWzJH2RJVc5Kblj+Pkx
         I2Wtall3JpLxHg1fEoXnXo1+85nJ5O7mP435yfASIJsWSaoQjNwEGb6AyT2vAAytemJJ
         WZI1cwFuTlBRTWuCY4ED/Rt6jbEhvGhNszXnx6gz/ymNQFEZ880Bby6NrcCNeU+xcT9B
         NyNFratNa0H1yQs3em3My5L1e4/tGZKaeSUX7GghX6EfoA7qqGpPf8iTFTxOy3XeyaeV
         62v30fIoCiRJXjYUo0kxV6GHs4Eb8l7C8ofZ1YUXJ0aFPf/mKXMdzICjdJ3l91+42QY2
         2xug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874671; x=1795479471;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1CqHinjbY2OgjrRQj70R8H/Be4OoPMLQb2dQpJZInM=;
        b=FmEAaPXaeOctbUNOesTnwGcmo2A8wdEkGWZk/P8cSpX8l8B222czuIDu4jFIpZNvN2
         Vf9s3MRfre7J8n2eCkJcG1lsTIo0MiujP4UNSvXY8gL1cbGQ8qVEwL/wQUDMxW87W/6r
         39Dmuyf1EVJu80coaG2+1WRz+LQTx74S5pddDZbQO0c6sQbAZhBSJFaYOGzrnta4Tmwf
         M8CAjx+b3dxBsQj9DA24HWDrlQ0Uv56xXInfc8BihA5sWVcFmn7/OtQFjv7iZfkPvYOV
         SPdLoub/IEa8c7YaZcB4oAl8wmog5vDo7btlxi/2AQRauRJH2pT1yAGboy0lZcAIyLsd
         516A==
X-Forwarded-Encrypted: i=1; AL+hErECPf4u2FUvviMhwQ3hCcaLRdMxthsftVQEar8h9jcXtdAGgXzqw5IqtKNkM8q6DhLvJm4T+lGCCjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aRnQoK68VpUAxyCq4V7rqkM61Kyir5eo0d9JJshOGow8NtL7q
	i8YjONv1i7wuD/SREJhom69WDr8e0urVPwcO3r/bUhC7ClBZEZ740Xua
X-Gm-Gg: AYBFou1sLEy4dnUvHiosXktcCtj5AAHtD7JafrXRy79ZMgM3E9N/X5tHJHGcEM+lAZc
	uwwZSaofuilwE3bQkzR5ibTQI0CaMw0xB++MMgtd97m+Lb67JBt4WBm4ME/q4TPRI5PkNHOSG/q
	NHATV5yIgH+Q6tG0BnNryBWK0tNrZkBvI88++/0bHui9Acx4ITcAEovSQXTqypbYuXfjSh8JAoY
	hF6VZzBsZKZH0qEdaTq/WXKrVq9dmPrSO9Q7/eGIJZ9S5OncvXyGwMUY94kXLUekxBKzTOo0Vyc
	lgHlzQJLwuOFcgoYaxuYpWZRfQvPfrloeH1+G77+UehikiWjAdO9UwSZwsCBamftdnUWMxg3sw5
	pPopsXyVX3JqEDrLz/JuOzGTtcQxQg0e/zF6mRL7ji5PUarflTRn6oNOUkXHRo8QSB3ozr63Ju+
	pjJdbz3fBqjYwgB0zcd8nKLxDH6vY6BYoTNV7Zen/rE0aR3eOG1heQVCLZvi4KSHRjN9BhzflWI
	Gtog8FEhq2GuiUMNiSu5W62Tu2i6XmaiThMLOieRC8tB1FyxRdnMyZmu997Wb2uOOxUiOfGKVN8
	SGc8Pd+X49oKMnAcualRdD6QAi1GQC8g+B8GSwEOBWj3T72WLV8q7/vwQUY=
X-Received: by 2002:a05:6102:54a8:b0:7cc:905a:331a with SMTP id ada2fe7eead31-7d69f73327amr262988137.14.1794874670820;
        Mon, 16 Nov 2026 16:17:50 -0800 (PST)
Received: from daniel-desktop3.localnet ([204.48.79.161])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e0859ebsm1155725137.10.2026.11.16.16.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:17:50 -0800 (PST)
From: Daniel Tang <danielzgtg.opensource@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Aleksa Sarai <cyphar@cyphar.com>, Christoph Hellwig <hch@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH v2] mount_setattr.2: Fix nonexistent perf_setattr
Date: Mon, 16 Nov 2026 19:17:48 -0500
Message-ID: <6091006.DvuYhMxLoT@daniel-desktop3>
In-Reply-To: <avuYP6-OQJMhLqCn@devuan>
References: <6099049.DvuYhMxLoT@daniel-desktop3> <avuYP6-OQJMhLqCn@devuan>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The problematic reference had been copied from openat2.2, where it was
fixed in bbed82c0693a ("openat2.2: tfix: fix minor reference typo"). I
performed the same fix for mount_setattr.2.

Fixes: f3a5ba3f0151 ("mount_setattr.2: New manual page documenting the mount_setattr() system call")
Link: https://lore.kernel.org/linux-man/20200929223509.11783-2-cyphar@cyphar.com/
Link: https://lore.kernel.org/linux-man/20191003145542.17490-1-cyphar@cyphar.com/
Link: https://lore.kernel.org/linux-man/20210730094121.3252024-1-brauner@kernel.org/
Signed-off-by: Daniel Tang <danielzgtg.opensource@gmail.com>
---
 man/man2/mount_setattr.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man2/mount_setattr.2 b/man/man2/mount_setattr.2
index 0f4b619d8..bb8da7ca4 100644
--- a/man/man2/mount_setattr.2
+++ b/man/man2/mount_setattr.2
@@ -846,7 +846,7 @@ acting as an implicit version number.
 (Because new extension fields will always
 be appended, the structure size will always increase.)
 This extensibility design is very similar to other system calls such as
-.BR perf_setattr (2),
+.BR sched_setattr (2),
 .BR perf_event_open (2),
 .BR clone3 (2)
 and
-- 
2.53.0



