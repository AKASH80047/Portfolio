import math
from PIL import Image, ImageDraw, ImageFont, ImageFilter

W, H = 1280, 720
img = Image.new("RGBA", (W, H), (14, 18, 25, 255))

# Font loaders
def get_font(size, bold=False):
    path = "C:/Windows/Fonts/segoeuib.ttf" if bold else "C:/Windows/Fonts/segoeui.ttf"
    try:
        return ImageFont.truetype(path, size)
    except:
        return ImageFont.load_default()

f_h1 = get_font(18, bold=True)
f_h2 = get_font(15, bold=True)
f_h3 = get_font(13, bold=True)
f_body = get_font(12, bold=False)
f_body_bold = get_font(12, bold=True)
f_small = get_font(10, bold=False)
f_small_bold = get_font(10, bold=True)
f_tiny = get_font(9, bold=False)
f_tiny_bold = get_font(9, bold=True)

draw = ImageDraw.Draw(img)

# 1. Warm Rich Background with warm wooden restaurant gradient and bokeh lights
for y in range(H):
    ratio = y / H
    r = int(14 + 30 * ratio + 18 * math.sin(ratio * math.pi))
    g = int(18 + 18 * ratio + 8 * math.sin(ratio * math.pi))
    b = int(28 + 12 * ratio - 10 * ratio)
    draw.line([(0, y), (W, y)], fill=(r, g, b, 255))

# Bokeh background lights
bokeh_overlay = Image.new("RGBA", (W, H), (0, 0, 0, 0))
b_draw = ImageDraw.Draw(bokeh_overlay)
bokeh_lights = [
    (140, 140, 110, (255, 170, 70, 55)),
    (280, 220, 140, (255, 140, 50, 45)),
    (1080, 160, 130, (255, 180, 80, 55)),
    (1160, 320, 150, (255, 130, 40, 45)),
    (180, 520, 180, (240, 120, 40, 35)),
    (1100, 540, 190, (245, 130, 40, 40)),
    (640, 120, 160, (255, 160, 60, 40)),
    (640, 600, 200, (255, 140, 50, 30)),
]
for bx, by, br, bcol in bokeh_lights:
    b_draw.ellipse([bx - br, by - br, bx + br, by + br], fill=bcol)

bokeh_overlay = bokeh_overlay.filter(ImageFilter.GaussianBlur(40))
img = Image.alpha_composite(img, bokeh_overlay)
draw = ImageDraw.Draw(img)

def draw_star(d, cx, cy, size=5, color=(251, 191, 36)):
    pts = []
    for i in range(10):
        r = size if i % 2 == 0 else size * 0.45
        angle = i * math.pi / 5 - math.pi / 2
        pts.append((cx + r * math.cos(angle), cy + r * math.sin(angle)))
    d.polygon(pts, fill=color)

def draw_burger_icon(d, cx, cy, size=18):
    d.pieslice([cx - size, cy - size, cx + size, cy + size//3], 180, 360, fill=(245, 158, 11))
    d.rounded_rectangle([cx - size + 2, cy - 2, cx + size - 2, cy + 3], radius=2, fill=(34, 197, 94))
    d.rounded_rectangle([cx - size + 3, cy + 4, cx + size - 3, cy + 8], radius=2, fill=(239, 68, 68))
    d.polygon([(cx - size + 5, cy + 9), (cx, cy + 15), (cx + size - 5, cy + 9)], fill=(251, 191, 36))
    d.rounded_rectangle([cx - size + 1, cy + 10, cx + size - 1, cy + 17], radius=3, fill=(120, 53, 15))
    d.rounded_rectangle([cx - size + 2, cy + 18, cx + size - 2, cy + 24], radius=3, fill=(217, 119, 6))

def draw_pizza_icon(d, cx, cy, size=18):
    p1 = (cx, cy + size)
    p2 = (cx - size, cy - size)
    p3 = (cx + size, cy - size)
    d.polygon([p1, p2, p3], fill=(245, 158, 11))
    d.rounded_rectangle([cx - size - 2, cy - size - 3, cx + size + 2, cy - size + 4], radius=3, fill=(180, 83, 9))
    d.ellipse([cx - 8, cy - 8, cx, cy], fill=(220, 38, 38))
    d.ellipse([cx + 2, cy - 4, cx + 10, cy + 4], fill=(220, 38, 38))
    d.ellipse([cx - 4, cy + 6, cx + 4, cy + 14], fill=(34, 197, 94))

def draw_drink_icon(d, cx, cy, size=16):
    p1 = (cx - size + 4, cy - size)
    p2 = (cx + size - 4, cy - size)
    p3 = (cx + size - 8, cy + size)
    p4 = (cx - size + 8, cy + size)
    d.polygon([p1, p2, p3, p4], fill=(249, 115, 22))
    d.polygon([(cx - size + 6, cy - size + 8), (cx + size - 6, cy - size + 8), p3, p4], fill=(234, 88, 12))
    d.rounded_rectangle([cx - 6, cy - 4, cx + 6, cy + 8], radius=2, fill=(255, 255, 255))
    d.ellipse([cx + 4, cy - size - 2, cx + 16, cy - size + 10], fill=(250, 204, 21))
    d.line([(cx + 2, cy + size - 4), (cx + 10, cy - size - 12)], fill=(239, 68, 68), width=3)

# LEFT SIDE CARD: Kitchen Order Pipeline Dashboard
lk_x, lk_y, lk_w, lk_h = 50, 150, 350, 420
draw.rounded_rectangle([lk_x - 3, lk_y - 3, lk_x + lk_w + 3, lk_y + lk_h + 3], radius=20, fill=(10, 14, 20, 180))
draw.rounded_rectangle([lk_x, lk_y, lk_x + lk_w, lk_y + lk_h], radius=18, fill=(20, 26, 38, 240), outline=(249, 115, 22), width=1)

draw.rounded_rectangle([lk_x + 16, lk_y + 16, lk_x + 48, lk_y + 48], radius=8, fill=(249, 115, 22))
draw.text((lk_x + 23, lk_y + 24), "KDS", fill=(255, 255, 255), font=f_small_bold)
draw.text((lk_x + 58, lk_y + 16), "Kitchen Order Pipeline", fill=(255, 255, 255), font=f_h3)
draw.text((lk_x + 58, lk_y + 34), "Live Restaurant Orders (Synced)", fill=(148, 163, 184), font=f_small)

orders_data = [
    ("Table 04", "Butter Chicken + 2 Naan", "In Kitchen (8m)", (249, 115, 22)),
    ("Table 07", "Crispy Truffle Burger", "Ready to Serve", (16, 185, 129)),
    ("Table 02", "Farmhouse Pizza (Veg)", "Order Placed", (59, 130, 246)),
    ("Takeaway #12", "2x Mango Passion Cooler", "Completed", (100, 116, 139)),
]
oy = lk_y + 64
for tbl, itm, st, col in orders_data:
    draw.rounded_rectangle([lk_x + 14, oy, lk_x + lk_w - 14, oy + 68], radius=10, fill=(28, 36, 52), outline=(45, 55, 75))
    draw.text((lk_x + 24, oy + 12), tbl, fill=(255, 255, 255), font=f_body_bold)
    draw.text((lk_x + 24, oy + 34), itm, fill=(160, 175, 195), font=f_small)
    st_w = len(st) * 6 + 14
    draw.rounded_rectangle([lk_x + lk_w - st_w - 20, oy + 12, lk_x + lk_w - 20, oy + 32], radius=6, fill=col)
    draw.text((lk_x + lk_w - st_w - 14, oy + 15), st, fill=(255, 255, 255), font=f_tiny_bold)
    oy += 78

draw.rounded_rectangle([lk_x + 14, lk_y + lk_h - 44, lk_x + lk_w - 14, lk_y + lk_h - 14], radius=8, fill=(16, 185, 129))
draw.text((lk_x + 40, lk_y + lk_h - 34), "Synced with Chef Tablet & Waiter App", fill=(255, 255, 255), font=f_small_bold)

# RIGHT SIDE CARD: Sales Analytics & FL Chart
rk_x, rk_y, rk_w, rk_h = 880, 150, 350, 420
draw.rounded_rectangle([rk_x - 3, rk_y - 3, rk_x + rk_w + 3, rk_y + rk_h + 3], radius=20, fill=(10, 14, 20, 180))
draw.rounded_rectangle([rk_x, rk_y, rk_x + rk_w, rk_y + rk_h], radius=18, fill=(20, 26, 38, 240), outline=(16, 185, 129), width=1)

draw.rounded_rectangle([rk_x + 16, rk_y + 16, rk_x + 48, rk_y + 48], radius=8, fill=(16, 185, 129))
draw.text((rk_x + 23, rk_y + 24), "POS", fill=(255, 255, 255), font=f_small_bold)
draw.text((rk_x + 58, rk_y + 16), "FL Chart Sales Analytics", fill=(255, 255, 255), font=f_h3)
draw.text((rk_x + 58, rk_y + 34), "Real-Time Revenue Dashboard", fill=(148, 163, 184), font=f_small)

draw.rounded_rectangle([rk_x + 14, rk_y + 60, rk_x + rk_w - 14, rk_y + 120], radius=10, fill=(28, 36, 52))
draw.text((rk_x + 24, rk_y + 70), "Today's Total Revenue", fill=(148, 163, 184), font=f_small)
draw.text((rk_x + 24, rk_y + 86), "Rs 48,650.00", fill=(16, 185, 129), font=f_h1)
draw.text((rk_x + 190, rk_y + 92), "+24.8% (142 Orders)", fill=(52, 211, 153), font=f_small_bold)

# FL Chart Visualizer
chart_bx = rk_x + 24
chart_by = rk_y + 136
chart_bw = 302
chart_bh = 136
draw.rounded_rectangle([chart_bx, chart_by, chart_bx + chart_bw, chart_by + chart_bh], radius=10, fill=(28, 36, 52), outline=(45, 55, 75))

bars = [("Mon", 50), ("Tue", 65), ("Wed", 85), ("Thu", 70), ("Fri", 100), ("Sat", 115), ("Sun", 105)]
for i, (day, val) in enumerate(bars):
    bar_x = chart_bx + 18 + i * 40
    bar_top = chart_by + chart_bh - 24 - int(val * 0.75)
    draw.rounded_rectangle([bar_x, bar_top, bar_x + 20, chart_by + chart_bh - 20], radius=4, fill=(16, 185, 129))
    draw.text((bar_x + 1, chart_by + chart_bh - 16), day, fill=(148, 163, 184), font=f_tiny_bold)

draw.rounded_rectangle([rk_x + 14, rk_y + 290, rk_x + rk_w - 14, rk_y + 400], radius=10, fill=(28, 36, 52))
draw.text((rk_x + 24, rk_y + 302), "Top Performer: Pandey Foods Special", fill=(255, 200, 100), font=f_small_bold)
draw.text((rk_x + 24, rk_y + 326), "- 142 Orders Processed with 0 GST Errors", fill=(200, 210, 225), font=f_tiny)
draw.text((rk_x + 24, rk_y + 346), "- Average Kitchen Prep Time: 12.4 Mins", fill=(52, 211, 153), font=f_tiny)
draw.text((rk_x + 24, rk_y + 366), "- Table Turn Time: 34 Mins (Optimal)", fill=(148, 163, 184), font=f_tiny)

# 2. CENTER SMARTPHONE
ph_w, ph_h = 360, 660
ph_x = (W - ph_w) // 2
ph_y = (H - ph_h) // 2

# Phone shadow & glowing halo
phone_shadow = Image.new("RGBA", (W, H), (0, 0, 0, 0))
ps_draw = ImageDraw.Draw(phone_shadow)
ps_draw.rounded_rectangle([ph_x - 14, ph_y - 10, ph_x + ph_w + 14, ph_y + ph_h + 18], radius=46, fill=(0, 0, 0, 220))
ps_draw.rounded_rectangle([ph_x - 24, ph_y - 14, ph_x + ph_w + 24, ph_y + ph_h + 28], radius=54, fill=(249, 115, 22, 65))
phone_shadow = phone_shadow.filter(ImageFilter.GaussianBlur(18))
img = Image.alpha_composite(img, phone_shadow)
draw = ImageDraw.Draw(img)

# Phone chassis
draw.rounded_rectangle([ph_x - 5, ph_y - 5, ph_x + ph_w + 5, ph_y + ph_h + 5], radius=40, fill=(30, 35, 45), outline=(90, 100, 115), width=2)
# Inner screen
sc_x, sc_y, sc_w, sc_h = ph_x, ph_y, ph_w, ph_h
draw.rounded_rectangle([sc_x, sc_y, sc_x + sc_w, sc_y + sc_h], radius=35, fill=(15, 20, 30))

# Dynamic Island
draw.rounded_rectangle([sc_x + sc_w//2 - 50, sc_y + 12, sc_x + sc_w//2 + 50, sc_y + 34], radius=11, fill=(0, 0, 0))
draw.ellipse([sc_x + sc_w//2 + 30, sc_y + 18, sc_x + sc_w//2 + 40, sc_y + 28], fill=(20, 25, 40))

# Status bar
draw.text((sc_x + 26, sc_y + 14), "19:42", fill=(255, 255, 255), font=f_small_bold)
draw.text((sc_x + sc_w - 60, sc_y + 14), "5G  98%", fill=(255, 255, 255), font=f_tiny_bold)

# App Header
app_bar_y = sc_y + 44
draw.rounded_rectangle([sc_x + 14, app_bar_y, sc_x + sc_w - 14, app_bar_y + 58], radius=16, fill=(24, 32, 48), outline=(45, 55, 75))
draw.text((sc_x + 26, app_bar_y + 10), "Dine-Easy / Pandey Foods", fill=(255, 255, 255), font=f_h3)

# Table badge
draw.rounded_rectangle([sc_x + 26, app_bar_y + 32, sc_x + 134, app_bar_y + 50], radius=8, fill=(16, 185, 129))
draw.text((sc_x + 32, app_bar_y + 34), "● Table #04 Active", fill=(255, 255, 255), font=f_tiny_bold)

# Scan QR button
draw.rounded_rectangle([sc_x + sc_w - 90, app_bar_y + 16, sc_x + sc_w - 24, app_bar_y + 44], radius=8, fill=(249, 115, 22))
draw.text((sc_x + sc_w - 82, app_bar_y + 22), "Scan QR", fill=(255, 255, 255), font=f_small_bold)

# Category Tabs
cat_y = app_bar_y + 68
cats = [("Popular", True), ("Burgers", False), ("Pizza", False), ("Beverages", False)]
cx = sc_x + 14
for cname, cactive in cats:
    cw = len(cname) * 8 + 20
    if cactive:
        draw.rounded_rectangle([cx, cat_y, cx + cw, cat_y + 26], radius=13, fill=(249, 115, 22))
        draw.text((cx + 10, cat_y + 5), cname, fill=(255, 255, 255), font=f_small_bold)
    else:
        draw.rounded_rectangle([cx, cat_y, cx + cw, cat_y + 26], radius=13, fill=(28, 36, 52), outline=(50, 60, 80))
        draw.text((cx + 10, cat_y + 5), cname, fill=(160, 175, 195), font=f_small)
    cx += cw + 6

# Menu Cards
menu_y = cat_y + 36

# Card 1: Royal Paneer Burger
card1_y = menu_y
draw.rounded_rectangle([sc_x + 14, card1_y, sc_x + sc_w - 14, card1_y + 92], radius=14, fill=(24, 32, 48), outline=(50, 60, 80))
draw.rounded_rectangle([sc_x + 22, card1_y + 10, sc_x + 94, card1_y + 82], radius=10, fill=(45, 28, 18), outline=(245, 158, 11))
draw_burger_icon(draw, sc_x + 58, card1_y + 46, 20)

draw.text((sc_x + 104, card1_y + 12), "Crispy Royal Paneer Burger", fill=(255, 255, 255), font=f_body_bold)
draw.text((sc_x + 104, card1_y + 30), "Veg • Double Patty • Secret Sauce", fill=(148, 163, 184), font=f_tiny)
draw_star(draw, sc_x + 110, card1_y + 52, size=5)
draw.text((sc_x + 120, card1_y + 47), "4.9 (1.2k reviews) • 12 Mins", fill=(255, 200, 80), font=f_tiny_bold)
draw.text((sc_x + 104, card1_y + 66), "Rs 249", fill=(16, 185, 129), font=f_h3)

draw.rounded_rectangle([sc_x + sc_w - 86, card1_y + 58, sc_x + sc_w - 24, card1_y + 84], radius=8, fill=(249, 115, 22))
draw.text((sc_x + sc_w - 74, card1_y + 64), "ADD +", fill=(255, 255, 255), font=f_small_bold)

# Card 2: Woodfired Artisan Pizza
card2_y = card1_y + 100
draw.rounded_rectangle([sc_x + 14, card2_y, sc_x + sc_w - 14, card2_y + 92], radius=14, fill=(24, 32, 48), outline=(50, 60, 80))
draw.rounded_rectangle([sc_x + 22, card2_y + 10, sc_x + 94, card2_y + 82], radius=10, fill=(50, 20, 18), outline=(239, 68, 68))
draw_pizza_icon(draw, sc_x + 58, card2_y + 46, 20)

draw.text((sc_x + 104, card2_y + 12), "Woodfired Farmhouse Pizza", fill=(255, 255, 255), font=f_body_bold)
draw.text((sc_x + 104, card2_y + 30), "Mozzarella, Olives, Crisp Peppers", fill=(148, 163, 184), font=f_tiny)
draw_star(draw, sc_x + 110, card2_y + 52, size=5)
draw.text((sc_x + 120, card2_y + 47), "4.8 (890 reviews) • 18 Mins", fill=(255, 200, 80), font=f_tiny_bold)
draw.text((sc_x + 104, card2_y + 66), "Rs 429", fill=(16, 185, 129), font=f_h3)

draw.rounded_rectangle([sc_x + sc_w - 86, card2_y + 58, sc_x + sc_w - 24, card2_y + 84], radius=8, fill=(249, 115, 22))
draw.text((sc_x + sc_w - 74, card2_y + 64), "ADD +", fill=(255, 255, 255), font=f_small_bold)

# Card 3: Mango Passion Mocktail
card3_y = card2_y + 100
draw.rounded_rectangle([sc_x + 14, card3_y, sc_x + sc_w - 14, card3_y + 88], radius=14, fill=(24, 32, 48), outline=(50, 60, 80))
draw.rounded_rectangle([sc_x + 22, card3_y + 10, sc_x + 94, card3_y + 78], radius=10, fill=(45, 30, 15), outline=(245, 158, 11))
draw_drink_icon(draw, sc_x + 58, card3_y + 44, 18)

draw.text((sc_x + 104, card3_y + 12), "Mango Passion Cooler", fill=(255, 255, 255), font=f_body_bold)
draw.text((sc_x + 104, card3_y + 30), "Fresh Mint, Chia Seeds, Citrus Spritz", fill=(148, 163, 184), font=f_tiny)
draw_star(draw, sc_x + 110, card3_y + 50, size=5)
draw.text((sc_x + 120, card3_y + 45), "5.0 (420 reviews) • Chilled", fill=(255, 200, 80), font=f_tiny_bold)
draw.text((sc_x + 104, card3_y + 62), "Rs 179", fill=(16, 185, 129), font=f_h3)

draw.rounded_rectangle([sc_x + sc_w - 86, card3_y + 52, sc_x + sc_w - 24, card3_y + 78], radius=8, fill=(249, 115, 22))
draw.text((sc_x + sc_w - 74, card3_y + 58), "ADD +", fill=(255, 255, 255), font=f_small_bold)

# Active Live Order Floating Card
order_banner_y = card3_y + 96
draw.rounded_rectangle([sc_x + 14, order_banner_y, sc_x + sc_w - 14, order_banner_y + 60], radius=14, fill=(16, 185, 129))
draw.text((sc_x + 26, order_banner_y + 10), "Active Order #104: In Kitchen (2 items)", fill=(255, 255, 255), font=f_small_bold)
draw.text((sc_x + 26, order_banner_y + 26), "Estimated Prep Time: ~11 mins | Total: Rs 678", fill=(230, 255, 240), font=f_tiny)
# Progress Bar
draw.rounded_rectangle([sc_x + 26, order_banner_y + 42, sc_x + sc_w - 26, order_banner_y + 49], radius=4, fill=(6, 95, 70))
draw.rounded_rectangle([sc_x + 26, order_banner_y + 42, sc_x + 230, order_banner_y + 49], radius=4, fill=(255, 255, 255))

# Bottom Nav Bar
bnav_y = sc_y + sc_h - 48
draw.rounded_rectangle([sc_x, bnav_y, sc_x + sc_w, sc_y + sc_h], radius=24, fill=(20, 26, 38))
nav_items = [("Menu", True), ("My Orders", False), ("Waiter", False), ("Admin", False)]
nx = sc_x + 20
for ntitle, nact in nav_items:
    ncol = (249, 115, 22) if nact else (148, 163, 184)
    draw.text((nx + 10, bnav_y + 14), ntitle, fill=ncol, font=f_small_bold if nact else f_small)
    nx += 80

# Home Indicator
draw.rounded_rectangle([sc_x + sc_w//2 - 40, sc_y + sc_h - 8, sc_x + sc_w//2 + 40, sc_y + sc_h - 4], radius=2, fill=(100, 110, 125))

# Top Badges
draw.rounded_rectangle([40, 40, 160, 76], radius=18, fill=(15, 23, 42), outline=(52, 211, 153), width=2)
draw.ellipse([54, 54, 62, 62], fill=(52, 211, 153))
draw.text((70, 48), "LIVE APP", fill=(52, 211, 153), font=f_h3)

draw.rounded_rectangle([W - 200, 40, W - 40, 76], radius=18, fill=(2, 132, 199))
draw.text((W - 176, 48), "FoodTech & POS", fill=(255, 255, 255), font=f_h3)

# Save
img.convert("RGB").save("assets/images/restaurant_mockup.png", "PNG")
print("Successfully generated composite restaurant_mockup.png!")
