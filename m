Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F983F6C30
	for <linux-man@vger.kernel.org>; Sat,  5 Sep 2026 07:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788594363; cv=pass; b=myAEq31UAPLxVpGa+Y7hBogC2+yscVV0iFdkFuYMv/vR7f5ZFFQ95Qg1zh6rcZWPW3y1yCP2TvtAvxV6Xy6YIPL+FvURjAWbEOuYgYnXLTYU8B5urQuCXh4tPsZ53sWidyP1y+YV+hrLXZvL11/XIkZV0dC60N0nUmowuqL8SRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788594363; c=relaxed/simple;
	bh=svBRPs/fXoIMNjLRyzscAT687G7DqRerfAef2tvmWS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJIphJrI2fDZiaTjbu/VeS0g5/Kel2TwjtbJ41UV1399cVX+CbOVpUlc7/bTxIco4mUCu2EdEhhKBPjWddIe5lXqkRyitBHp5824xXoqKN9E3Gig30c1+facQEIswDlBwSBF5KZtnzq6dwIyvqt0jmhVDkg+IPUyQJpE5gLpRHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOZyIlNh; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOZyIlNh"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66fb7ba702eso238021d50.0
        for <linux-man@vger.kernel.org>; Sat, 05 Sep 2026 00:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788594358; cv=none;
        d=google.com; s=arc-20260327;
        b=MdJzkZbcfRuteK+ifhbq1Ox0QflArh+kgSB/uf7eg6ZA3Aic/QEIhVt69lLRTFgzVQ
         O6xJ+v6rqLuoUC7bEOctQacBRpBAM617CFrNG8yQP+49LUQtgriUikurNq7itb8on682
         Kr+ppx2fH8sqwqqJNupLQwXFoPnKDl1n40nh5CEFlCxvwMdrKI3EYTEm5FW2xZkVNTuU
         BJAfHLMJpyW5KcmoOfwP11+XpXT93WMATFVF/PA+G18fCk2vTu3M/VAWMlmjyvCW5DAz
         TqAU+tihVQOQI8mktK6kjVMP4Wlz2UVSjHrYZZtbmOFtVxz6ffGhlA5IwdBADvumu5FE
         61iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kiFI3c2SPovBA6XiCmh9K3RudbozAYSqI0KaFvYbrJ8=;
        fh=HQrAeJGtoj0mrk18UcVkFyZbpURbuUn9DSibLkpCvQs=;
        b=VYOYRTYRdmYh8bqmROEtonFAmAcOtHvK4joygxDtG++iGdUyFSrKjCFb/RjyHIbqJf
         U5xTwObeIsKFo4qXf6q4vklaX8bC1dtOT/a7hjlLx8K8SZZhuaJR0BSguptyvWyDtPCI
         DQPXI4NfPijvPv7xpwhybNs6qu7fVT/pB6cdQqtyTnu2/dZnSxBLOb6RN0pe2mDqc+EN
         JtM2s0O+8jIMs6bE9G9bXDJpsLlaMlqJLAEVFhY4lKKKB0T6Z/Xj/u3zahUOyPtfPV+7
         Cj/bp70QG2GL6s8Y2svbRSxgom7ObVrNKKjjKY5XzGCWgjeP+Om3HvYzO/mnpAXQvpMO
         zruw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788594358; x=1789199158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kiFI3c2SPovBA6XiCmh9K3RudbozAYSqI0KaFvYbrJ8=;
        b=LOZyIlNhz2Msed+EfwpKb1oQ80QgZ8swkSgDKX0LSb3D2xRyuk7E3yxeK1ve5FSEHB
         IDSYExEU5/ct4ajmawZiX7Vg+BOy5nSIGiICc0usYw5i8c3Qm+/Y8XLn3vQSXXdFJn4U
         KUcpKkqA6PPkg7jhlJ+cBWPZ4i0xhd6Lz7fHtiKhPsVUeQzh9Had/3Cr/ularz6/lDUV
         sE7CI2XW7TZO0zfkacsT7acYttIwr6/b6b+8g/oUUHMmB6ZrD8v2d4QZoG4ZGFXrRkCj
         g1JuXeEvdGbkvdqGyUhIu15N4APYc1IbaLrTSD2WVIxR+5wswW0Tjw42E9DLn1iE4am8
         BGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788594358; x=1789199158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kiFI3c2SPovBA6XiCmh9K3RudbozAYSqI0KaFvYbrJ8=;
        b=emIJl8RYWBP0ELpeWGOMrGHHraQ4uLAu2ciHhk/W8czjMAQmnzlSfwuMOESQNKiwiJ
         0/9Pec1jW3OxYsGvsUQMKWht2F/KrxpO3BcRUEdXZcYDORt/cR1TduS6MI2UA88u6ItS
         gx3Al1AELFmeSROW3iFsGjEXl6eo1UVQbqHzqQtr5iB4SKelB3ydCf567mHldgkNRLZ8
         NYkyEmxsqa2jwJNE+nqpAV5WPcfNA1WEKEIpfIUt0O0GOs2/YN/3S4WOHAlBNS9JQDoC
         hLfCyZZoO0RipZjsTAO3tTlMYNaFnvw9pwkeRoe9frDQu33OIb0S/nJ4OYa2aaui97G9
         Y+NQ==
X-Gm-Message-State: AFuF++nhrL7dP+kASKJrBJrMl81H+ACiHQUXACVhrTcB8/t1IxJkctPo
	dvc+3Zks9aEKHLKm3TI3SqkSvJ+kzNW3sAbFcXHMU9937bjjzferLfL852TZ3yn695tA55C0Fkb
	zG/eXcm3UF0tslBVDE44LzW4plal7H0g=
X-Gm-Gg: AYBFou2jDLyK/PeZGx3QJQqoIH8Oc/SugtJf9mgsg++ez7XY1ixu6F+EMTVS7Ct1GDx
	TByZ5DTni7Emm2Ys4A6vAOdupAE323ruFxENxxk2vGqXFjohTntlcqJuiguYzlN7ZXtzc7RtD3y
	zuV+V5yVnh5b0avxu03KPzOa8vr5krUlhLfBpRr/Pxask9tgow8GrUhSTQYeoWcWT/m+cUwex9m
	TfOHaucweUJkc//cKnEGOfD7xtg5EoTvx7O4NlS5xGXEoz/5EZ1kp+RMVZdzwdFTDwaX7e3+FP6
	X9pN0cXH0PZZNOc0a0ktKsXUwNq3xBFuI8fXMcly/borYWl2tV/Ibt04AUpRW+Yf5lwTy/j2duQ
	=
X-Received: by 2002:a53:d74b:0:b0:668:43a3:9de3 with SMTP id
 956f58d0204a3-66fc2f94874mr866173d50.3.1788594355925; Sat, 05 Sep 2026
 00:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE8uRQ0-xyboJ3gy5wu-EaoQ2UEj4bL74hnrosaMpNkqJ9vYnA@mail.gmail.com>
In-Reply-To: <CAE8uRQ0-xyboJ3gy5wu-EaoQ2UEj4bL74hnrosaMpNkqJ9vYnA@mail.gmail.com>
From: Maxim Inozemtsev <milnadar@gmail.com>
Date: Sat, 5 Sep 2026 00:45:44 -0700
X-Gm-Features: AcwNN1X_Wqpg5wDbwgeXkoV_q7t-u4qUEEJ0rcaIg1A_pVom4ZwPntlZs2H5D0w
Message-ID: <CAE8uRQ1WhW=5X-zCCi4g9y4s-rEYdmY_=2o4Re1thKyijV3RXw@mail.gmail.com>
Subject: Re: Subject: [PATCH 0/1] inotify.7: Fix typo in struct size calculation
To: alx@kernel.org
Cc: linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From 9b0b60cfd59dc5b89c59ec255ef7da77c0dbaf25 Mon Sep 17 00:00:00 2001
From: Maxim Inozemtsev <milnadar@gmail.com>
Date: Fri, 4 Sep 2026 00:12:32 -0700
Subject: [PATCH 1/1] inotify.7: Fix typo in struct size calculation

---
 man/man7/inotify.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man7/inotify.7 b/man/man7/inotify.7
index 9575b82e7..675f86f4b 100644
--- a/man/man7/inotify.7
+++ b/man/man7/inotify.7
@@ -137,7 +137,7 @@ including the null bytes;
 the size of each
 .I inotify_event
 structure is thus
-.IR "sizeof(struct inotify_event)+size" .
+.IR "sizeof(struct inotify_event)+len" .
 .P
 The behavior when the buffer given to
 .BR read (2)
--=20
2.55.0


On Sat, Sep 5, 2026 at 12:44=E2=80=AFAM Maxim Inozemtsev <milnadar@gmail.co=
m> wrote:
>
> The documentation explains how the size of each `inotify_event` structure
> is computed using fields from the structure itself. However, it mistakenl=
y
> uses the term `size` instead of `len` at the end of the math expression.
>
> Since `len` is the actual field name indicating the bytes in `name`, fix
> `sizeof(struct inotify_event)+size` to `sizeof(struct inotify_event)+len`=
.
>
> Maxim Inozemtsev (1):
>   inotify.7: Fix typo in struct size calculation
>
>  man/man7/inotify.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --
> 2.55.0
