local ok, markview = pcall(require, "markview")
if not ok then
	return
end

-- require("markview").setup({
-- 	callbacks = {
-- 		on_enable = function ()
-- 			vim.o.foldexpr= "nvim_treesitter#foldexpr()";
-- 		end
-- 	}
--     injections = {
--         languages = {
--             markdown = {
--                 --- This disables other
--                 --- injected queries!
--                 overwrite = true,
--                 query = [[
--                     (section
--                         (atx_headng) @injections.mkv.fold
--                         (#set! @fold))
--                 ]]
--             }
--         }
--     }
-- });
