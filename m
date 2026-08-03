Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F124E3A71AD
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 20:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785788093; cv=pass; b=Igg+7EVHahb1nOJQFCzKxzJoDmQeRZmE4WYGa6gtATyPhpROg2towtin5NKpjkcs7ziyHe8oBS3626gNWnouYuqbu7MKCfs9UrqWPYZ2p9U43Z7trCTXzwRkhD7XvyCuGyV/CXvCsrIsXkiFM3jBHFLuuzR3zzpwQvO708T0Hqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785788093; c=relaxed/simple;
	bh=G7xQezU4Tebo0K07W+4dXNGLrE/7AxKW0QUkGwpHI4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gqe1RX29sGTSiOt7W1xd1FQmxF/+ZORWkFGFLDZqCvssPawcSA0E58EVt2WMh0goabMTbvWQYYHKtLcZ42v4yEd2w+XeKIpSVgOBgtnOzaJL6v+dfD10OrCvLQB+pf06FcdCvLlQ1K9XbUQXQhd5lF6AIxApX768x/9Vvu5klog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzsOtP3l; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzsOtP3l"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b021916bd3so3877292e87.3
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 13:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785788090; cv=none;
        d=google.com; s=arc-20260327;
        b=UGUb0pwNpQw2hxT+u2Tz/xRXSJpyywWDWSQiljsu/JzUHDZX8/ecJihDR3BE2B8Ec6
         839LiOOzUmvgHrjUbnZkVjsk4JaUWDByd/+XS5BLxTU6NpE/HruxR/gBXrXbW/GJ7GCK
         vgn+YZ3n50rhmdRGx2r9LqASQ7maKY0GSLKoaKVPJN5qNQ4YtWP+uXfdDmTUaa0oJ4Uj
         ovEpusht0qJbwodV9fq4tqr/yQtBD4M62AwJoLbE6BxH2knQ7PfyukGbLe0cwa5qnK56
         pg7bYlTCzwQKYWelzLy+B6F8nzQuxuPijRl+ihQWbaLoeJe7T5uRqQ2b5/QF+Svb2FyN
         03VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TCdTiR+5WWvOUW7ZQlZ9SG1Y5wIKQBknawZKX0CxIEw=;
        fh=r53a8yf6iYNG4IE8XFNUSStcZ4q65gV/87S4riW5rCA=;
        b=C11f72dzJhx1xbNnOARGf02jjEVu/FkxsfgvfEuJof3ehnJ5BO75w8YZQNvp0EddIX
         yQA5Bu5lKatbz7xB08TYHJs73RS0qAi4i+TuVJTyZOyuRS1QuEfSoCAiMvd5OToVjGrZ
         O4Sf3TGYDPydmqU3iYvkFjC0Pruerp3ysRoACEL7LV/URGorvnrSGcEzNqpp/QC03PWC
         07N68pUz9OFOYrlXOd1TkdwT/McxVR+DWbpadYChWMbmtUQX9c+jJJ2nr1oc+9cahawv
         Q5A0lpJ4sNglTDla/oI9kf/cQCHWgOTWRR5QIei3ArJOp+4vPePbhvFdGKfAATKRk+tp
         L7Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785788090; x=1786392890; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCdTiR+5WWvOUW7ZQlZ9SG1Y5wIKQBknawZKX0CxIEw=;
        b=OzsOtP3lmtQW5DIdd2apXeakE22/EDbd/A+cmCW9j6qJU12tTKUXBWkcEg6uJtHaYo
         F+/8lGMYxPam8eWkxvsMyI4QnqgUAoqepx0fxFmhcl6aW7uCLcauoPPSNI35OZoPwbmD
         UQ8UfL5FByyVHaX7DqbK2D9xHibsWbCWb4oYK7Ed5vn2XEXIrrt5EDyAWP+g+8qQYkv2
         5TtNv49b+vgxOVnCU6x6kiRkYIsXy8xZFxBctJJMmLmREAyEkhy4kV7UfgQQUFfdnp/Q
         RsUcj9+I1DIY3QC0AUMVraIOw69HnQeM6xVpmT77ZIKObUIhT+qE4MFitU9gbYLk8Qyg
         rQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785788090; x=1786392890;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TCdTiR+5WWvOUW7ZQlZ9SG1Y5wIKQBknawZKX0CxIEw=;
        b=Mzc3sJGHKD/dFv1KC3hQcKHpgh6w5xQxYPLiOmCNFioYQPUw3bLlYj+tsD0kyayBqZ
         jvoj6QP7DDQPCtJ2Q3W899WD0Ttvxr7oz3U2Kd5shjD9MEb7NCcTcS9DEFUylpINOv9c
         pPLkluNwseTAUbrkhfFWzZMesHbtlbTwOBNE1rmnHMlTVghJ/I/pt5uk1c5mm3MWpBtj
         knySIHeKWvW6e+SAij6OIvYhsE4Y10eNX6+BDQkG/C4ubFUm+5q9strjg0XlRWN0wKhV
         a6ZGGfv6L7KkdA9QEPshF7+HKO3/MmymVsKCfHS/jUKyk0bkcy3pXuFIxUgy167m/aDx
         7zNw==
X-Forwarded-Encrypted: i=1; AHgh+RofBCO3gCl1TBEugv6yqHWLgF+Zh5MhDX9NS/rQnGuAZJVc6d6MGM1mqoN6zSSh0cWiu0bLDEXR5r0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVwvxHBcGKyvhI2igZUj83a9Hk/ccfyRJUvo3YshCvTQjfbTfE
	3l7MBYPz3GI4aI9HxHQqHORPXETDlAr4t7oNVVdEjOV83xpfYpuFp+ESIyb92yHqD/53H5KcBYr
	hQ4gnMUk/Kz+AsdPeakhRaXWQCsUCtX8=
X-Gm-Gg: AR+sD122iLZLg90/ITRfLjW2MHufBloxG5vVPcPlSs6CJRhgdQgxwxQXsEamXxiQQFY
	HrYqTl7H1v2++hodELF+o0AgROxsXNA1F2fhnzowmBWSuK67BJxeovyunVBAlWwPWgzffYIwRr5
	zGGCL8ifzFGYs6uxIFJEgoEJZA6+BB3TNOcYkN4Rt3Mv+/fg9FoFRtvBahKeAZxlYCNPUFGTHp8
	HAEv2NNkRMtEXFuUPMOaYAm834mi4PUMoJVKkajjQbkHyByy1peIwz8zzWpS+m4YAIGvmdktTkn
	1RmXgvp4209kgKz5DrGnv8UfJ2MInHompJjaC3e4p0Tq8ic80Q9e09kuIp4NtnxWzRuFvv1kz5W
	0GID1Tku5wQ==
X-Received: by 2002:ac2:4c32:0:b0:5b0:2190:1470 with SMTP id
 2adb3069b0e04-5b2e4f19d11mr1518624e87.3.1785788089385; Mon, 03 Aug 2026
 13:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <am4GT1OkqNZD9FF9@devuan> <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan> <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan> <am5_uA4MSujYCS9X@devuan> <20260801235332.vc443gozbqkqdqm5@illithid>
 <am6HTtAMkEEkWjfl@devuan> <am_jYJL6uAapMGXN@devuan> <CAMdZqKGRJuR_Jyt7TapMQFQ-6wz=OF5DROFhXkZLQNAn2vyimQ@mail.gmail.com>
 <anDgpLT-FlRrJKC2@devuan>
In-Reply-To: <anDgpLT-FlRrJKC2@devuan>
From: Mark Harris <mark.hsj@gmail.com>
Date: Mon, 3 Aug 2026 13:14:35 -0700
X-Gm-Features: AUfX_mx1O6uEoOYe1yPp8gs9vx9xJApnbYJoKFRxtDDwe40r3XtV8lEey68uuD8
Message-ID: <CAMdZqKH1=20mAxRR0-F+Pf4EXv57Nchr1TSwe_5CsEaEKp00rQ@mail.gmail.com>
Subject: Re: proposed revision to memory.h(3head)
To: Alejandro Colomar <alx@kernel.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, Keith Bostic <keith@bostic.com>, 
	linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Alejandro Colomar wrote:
>         SYNOPSIS
>              #include <memory.h>  // See STANDARDS

intro(3) implies that the SYNOPSIS section intends to reflect the
function's API; i.e., the interface that it has agreed to provide to
applications.  Do you disagree?

If strndup(3)'s SYNOPSIS stated "int" instead of "size_t" for the
second argument, it may work fine in many cases but that is not the
API that it has agreed to provide so it is inaccurate.  Similarly if
it states "memory.h" instead of "string.h", even if it happens to work
on some systems, that is not the API it has agreed to provide so it is
inaccurate.  If memory.h ceases to provide a usable declaration for
strndup(), that is the problem of the person that relied on the
inaccurate information because there was never any agreement to
provide a usable declaration of strndup() in memory.h; they should
have used a reliable source to determine the API that is actually
supported.  I am having trouble figuring out where you disagree with
this seemingly-straightforward logic.


 - Mark
