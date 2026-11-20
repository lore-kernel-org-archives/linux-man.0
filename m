Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191148;
	b=J1eRgUiGjFh8tfxGFFYH4dOfrTEcaupBE9wISnDxhhAFyoAeZyuS0TX6VhRooH+lqsbl
	 UthaP25chsUXfOXFibhtZaI15AjbHtPzpxw6Y2xhUOpduGY/D/nL/1OaDZ+C47TGmzofM
	 UaLsGwbbq8a3Jqwf+d0Rgj/gUNeMK58QFjw4e2xOnOmoJMYmf7CYon1lcPbjZlhzoB94z
	 VItxdlZJhETiRFc61fnNgbcjrPiP2eVWxZ1KJJxDL3AZCYxiy3lvDo4xcfi3L7XGBSut+
	 tkooKZQEcjrC06MWAcMGoUkKz6o7EoqtS3nz3tt0aMReVminOhfuTrnFxgvq9ixAYlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pY2lTfoa5WO+fNiBGxh58uyhEndigHrS6tYATFnyikU=;
	b=UhP0Cjgr+TWwAyxWd2DTAFKPqUt7iSUbNQYRTFBh3VzC/IkplrYOeCCTyxcq1/niLlMa
	 dcV9TUvd6eT8g1bcC9sLK+uxmRh/yo1Ry0tPO5GUZPJnRLlnZnWvpZMjjsa+263uHdDCA
	 VIa7txMc6rhh2FHzfoLcoFA1KGWCxuXdaxUrzaHIL8+JmLol1vOk9zSuXrOTn7ECPKNuR
	 lEx5CQt0NpVNXJVENL1/tsLDt+6IPtNK7PJVs4Y5zojlCy0x4S/i074dnIHMr/aOxe7D1
	 rFweyN8oj3v1YQQ7FqMpMESrWFsyOdpe+el1s7kKOz6I5miJC621T3sepwm7HmODtqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7qeIwCl;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822EA606A339
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 16:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 822EA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7qeIwCl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491971ac844so936227f8f.2
        for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 08:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191147; x=1795795947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pY2lTfoa5WO+fNiBGxh58uyhEndigHrS6tYATFnyikU=;
        b=G7qeIwCld1A9gv1KytseSKNEDttDXPIRzK6dkHbnFEfbLbfW5Sur0QVdmMH103iIo/
         jQwNjYTMcKij61hZWs7w1bZhbHeQgXaekYOxqWotK86VLMUO/ttUAfdndZ3Fm0i5ugQO
         M3jjT00k94wO1qEx4ywe5nILnY7Wl4EOGE0vqKxpyjpRA9w5Fp44OlQlPwOma6hnrGCo
         fJD7FKcVeyl1Cj5tu9UGSnXIPc/GFRM5Pt9BzKp0rDT1uJDfGcNciIjSQWb0sUiAoQp8
         bxsMN4YOc5sS4MZXRtO9P/nJkHLZ+C7LFqM+GymzBJuYYv3cEvNcDcBIcVkFGDvNNF+C
         9ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191147; x=1795795947;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pY2lTfoa5WO+fNiBGxh58uyhEndigHrS6tYATFnyikU=;
        b=2DjljxNkBMcqmjUudQLxdLxKThYErpJZXhhQbN6ddmOUmrxIGZqUvxLAN/QZZzrtzE
         nn2E6DRETSNAixqMX1OrStGKR0L7pZLMoqkrPlXiGUCjVB/polCR8ak/7DUvB4kDJQX9
         V7624nfrwH424/24zqrMjIwO/DyV+WkyXFTqCcC8+REGGyl4EI8voIJajIMkSXuY01mm
         /qYeHC9ZVoa6vFVmOG/VecDIYv9XwLNPhimTAEpb+lzkTDPiuH7b+LI9jLYPz6uG55NJ
         bO/HzkC7YEMJCAw72GmBPBSibw06sjX2isOZrE4WLs/DPFPVC/gpgWXr08t9WHc3CrP9
         Dz6A==
X-Forwarded-Encrypted: i=1; AL+hErHLabk08bTnZ8eoE0YNg8yaGC8NBUz2V6jRfQVSEOTfrq3mJPKMTlFWlPJ17OFaQGNLUqPHJNAqAMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dd+iIiPBOy0B6SygsMGurI08rm4yZeSwqFf3YjCTAN8d76vHl
	DXz9wH/7Gx6EFsXD+WOj/nLlNuPmbo+JLLTqRgtHm0+qnQkPK0aYQ32f
X-Gm-Gg: AYBFou3+DaeKJo7h+449fSmcfZ5KPJbtOt3Yp+z49Aj4diprBW6EmCyV0a+RwxGSOO6
	78ZSXWL6uo24SiEY6oCI/wz4kO2HjuZU3R/lt8cpRlMlqs/apUfCefy0fYxekZdRGKkxr+ypvwS
	hQVqi7sDDzjI6JeX1ycXK+gO0BP+ff4fLlYDMCSDRGM2XC5p/dTevhU2+tGX7amCoQJiaAB2h4M
	GjyregBLlnYzDo6baXvGECICKwa3MSbkuQhzVZ8/aJ4fiUFBM9h2HJqoR/JJ+sEFA2DbprMpsL6
	MJomvJ1Vs+6M4BEypAZ/zXxoMRQtrTnF9Bk5VEbPHXOlF3OJVL5EfwoAj9ZhHjbFofmNl8j/bQX
	BzvMecgCmEbJW8TdfpbSqeoUAEi84c1GD6cx0ZkJYcl9gToMdJTFOvdhrfTg88/dSoeHPG1bUNi
	ZKZrzXErFc14AYeEmd6Znac5hYTBK88HxsLyewSQvreDIA6Va2t6WxTSGDwveD7QUh0+zLRe1db
	Yeg11IzvvlY2RfedG55fj0ye6zG7m/m6rJ5HJf5jk+SRULuWZ1v81t8bzwKX0TPVFmZYHeQ1+Is
	i4Q7lTGUb6HPFcJ26qLQUU5s6lA2FlchvlWAKf4+6DU7nbfuOZwlCQ==
X-Received: by 2002:a05:600c:1548:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4bb887fe7e0mr87926495e9.9.1795191146732;
        Fri, 20 Nov 2026 08:12:26 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm6585781f8f.16.2026.11.20.08.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:12:26 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH v3 2/5] man/man7/unix.7: SO_PASSSEC: wfix
Date: Fri, 20 Nov 2026 17:11:59 +0100
Message-ID: <20261120161202.27163-3-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120161202.27163-1-gnoack3000@gmail.com>
References: <20261120161202.27163-1-gnoack3000@gmail.com>
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

Use "security context", as in the description of SCM_SECURITY.

Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 3322d915f1bb..532c50b94ec3 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -312,7 +312,7 @@ .SS Socket options
 is an integer boolean flag.
 .TP
 .B SO_PASSSEC
-Enables receiving of the security label of the peer socket
+Enables receiving of the security context of the peer socket
 in an ancillary message of type
 .B SCM_SECURITY
 (see below).
-- 
2.56.1

